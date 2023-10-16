.data
length: .byte 64
str: .asciz "La cantidad de bits en 1 en rax es: %d\n"

.text
.global main
main:
    movq $0xfeffffe, %rax # el numero al que queremos analizar.
    xorq %rbx, %rbx # guardaremos la cantidad de bits en 1 de rax en rbx asi que lo inicializamos en 0.
    xorq %rcx, %rcx # inicializamos el registro rcx en 0.
    movb length, %cl # movemos la cantidad de bits al registro que usa loop para iterar.
    cuerpo_for:
        # movemos 1 bit de rax a la izquierda
        rol $1, %rax
        # sumamos CF a rbx, 1 si el bit en la posicion 63 (empezando desde 0) era 1. 0 caso contrario.
        adc $0, %rbx    
        loop cuerpo_for
    # cantidad de 1 en rbx
    ret
