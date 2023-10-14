.data
list: .long 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
length: .byte 10
long_size: .byte 4
str: .asciz "La suma es: %d\n"

# La longitud de long en mi pc es 4 bytes ya que su arquitectura es x86
# en caso de tener arquitectura x86-64 u otra en la que long mida 8 bytes
# se deberia cambiar el valor de la variable long_size al tamaño correspondiente.
# luego el elemento i-esimo de list estará en la ubicacion de memoria
# $list + i * long_size.

.text
.global main
main:
    xorq %rax, %rax # inicializamos el registro rax en 0.
    xorq %rcx, %rcx # inicializamos el registro rcx en 0.
    movb length, %cl # movemos la longitud del arreglo al registro que usa loop para iterar (ya que queremos que itere por todos los elementos del arreglo).

    cuerpo_for:
        # obtenemos el indice del valor deseado que es rcx - 1 y lo guardamos en rbx
        movq %rcx, %rbx
        subq $1, %rbx
        # obtenemos la direccion de memoria donde se encuentra el valor que queremos sumar y lo guardamos en rbx.
        leaq list(,%rbx, 4), %rbx # donde esta el 4 deberia ir long_size.
        # sumamos el valor que se encuentra en la direccion de memoria a la que apunta rbx a rax.
        addl (%rbx), %eax
        loop cuerpo_for
    # imprime lo guardado en rax que es la suma del arreglo.
    movq $str, %rdi
    movq %rax, %rsi
    pushq %rbp # Alineamos el stack
    movb $0, %al # Cantidad de argumentos de punto flotante
    call printf
    popq %rbp # Desapilamos para preservar el valor de rsp
    
    ret
