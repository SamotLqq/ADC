.data
list: .long 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
invertida: .long 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
    # primer for para guardar los elementos del arreglo en la pila.
    xorq %rcx, %rcx # inicializamos el registro rcx en 0.
    movb length, %cl # movemos la longitud del arreglo al registro que usa loop para iterar (ya que queremos que itere por todos los elementos del arreglo).
    cuerpo_for:
        # obtenemos el indice del valor deseado y lo guardamos en rbx.
        xorq %rbx, %rbx # inicializamos el registro rbx en 0.
        movb length, %bl
        subq %rcx, %rbx
        # obtenemos la direccion de memoria donde se encuentra el valor que queremos almacenar y lo guardamos en rbx.
        leaq list(,%rbx, 4), %rbx # donde esta el 4 deberia ir long_size.
        # almacenamos el valor en la pila
        pushq (%rbx)
        loop cuerpo_for
    # segundo for para recuperar los elementos en la pila en el orden inverso.
    xorq %rcx, %rcx # inicializamos el registro rcx en 0.
    movb length, %cl # movemos la longitud del arreglo al registro que usa loop para iterar (ya que queremos que itere por todos los elementos del arreglo).
    cuerpo_for_2:
        # obtenemos el indice del valor deseado y lo guardamos en rbx.
        xorq %rbx, %rbx # inicializamos el registro rbx en 0.
        movb length, %bl
        subq %rcx, %rbx
        # obtenemos la direccion de memoria de la lista en la que queremos almacenar el valor y lo guardamos en rax.
        leaq invertida(,%rbx, 4), %rax
        # obtenemos la direccion del valor que queremos almacenar y lo guardamos en rbx.
        popq %rbx
        # almacenamos el valor en la posicion correspondiente de la lista.
        movq %rbx, (%rax)
        loop cuerpo_for_2
    # arreglo invertido en invertida. (una forma de verlo es ejecutando los comandos que estan abajo una vez llegado a ese punto del programa).
    movq $invertida, %rax # p %rax = 100, p %rax + 4*i = 100 - 10*i con i = 0,1,...,9
    movq $list, %rbx # p %rbx = 10, p %rax + 4*i = 10 + 10*i con i = 0,1,...,9
    ret
