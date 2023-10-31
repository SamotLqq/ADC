.data
x: .float 1.6, 3.2, 6.4, 12.8
y: .double 2, 2.5
z: .float 0,0,0,0
.balign 16 # si no usamos este comando el programa nos tira segmentation fault en caso de que la memoria no este alineada, que es en la mayoria de los casos.
.text
.global main
main:
    movaps x, %xmm0
    movaps %xmm0, z
    movaps y, %xmm1
    movaps %xmm1, z
    ret

/*

luego del primer comando (movaps x, %xmm0)
xmm0 = v4_float = {0x3fcccccd, 0x404ccccd, 0x40cccccd, 0x414ccccd}
luego del segundo comando:
z = 0x3fcccccd = 1.6
z + 4 = 0x404ccccd = 3.2
z + 8 = 0x40cccccd = 6.4
z + 12 = 0x414ccccd = 12.8
luego del tercer comando:
xmm1 = v2_double = {0x4000000000000000, 0x4004000000000000}
luego del ultimo comando:
z = 0x4000000000000000	= 2
z+8 = 0x4004000000000000 = 2.5

para hacerlo con variables de la pila deberiamos usar un and para apagar los ultimos 4 bits asi, la direccion resultante será multiplo de 16 y estará alineada a 16 bytes.

que la memoria este alineada a 16 bytes significa que las variables, por ejemplo, son como minimo 16bytes-distantes?:
La alineación de memoria a 16 bytes significa que las direcciones de memoria de las variables o datos deben ser múltiplos de 16. En otras palabras, la dirección de inicio de una variable alineada a 16 bytes debe ser divisible por 16. Esto no significa que las variables estén separadas por 16 bytes necesariamente, sino que su dirección de inicio cumple con esa alineación.

Si tienes múltiples variables alineadas a 16 bytes, la distancia entre sus direcciones de inicio será al menos de 16 bytes, ya que la próxima variable también debe cumplir con la alineación de 16 bytes. Esto puede causar espacios "vacíos" en la memoria entre las variables si no se utilizan todos los bytes de ese espacio para almacenar datos.

La alineación de memoria es importante en arquitecturas de CPU específicas y puede mejorar el rendimiento en operaciones de carga y almacenamiento de datos. Sin embargo, también puede resultar en un mayor consumo de memoria si se generan espacios vacíos. Por lo tanto, es importante equilibrar la alineación con la eficiencia de uso de la memoria según las necesidades de tu programa.

GRACIAS CHAT GPT

esta es la alineacion de la pila:

# Antes de cualquier manipulación de la pila, guarda el valor actual del puntero de pila (RSP) en otro registro.
pushq %rbp     # Guarda el valor original de RSP en la pila.
movq %rsp, %rbp # Establece el nuevo puntero de marco (frame pointer).

# Calcula cuántos bytes necesitas agregar o quitar de la pila para que esté alineada según tu requisito (16 bytes en este caso).
andq $-16, %rsp  # Alinea RSP a 16 bytes (elimina los 4 bits menos significativos).

# Realiza tus operaciones con la pila aquí.

# Después de que hayas terminado de trabajar con la pila, restaura el puntero de pila original.
movq %rbp, %rsp  # Restaura el valor original de RSP.
popq %rbp        # Restaura el valor original de RSP desde la pila.
*/