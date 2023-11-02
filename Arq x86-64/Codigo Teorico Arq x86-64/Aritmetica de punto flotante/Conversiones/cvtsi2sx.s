.data
x: .quad 3
y: .long 4
.balign 16
.text
.global main
main:
    movq x, %rax
    movl y, %ebx
    cvtsi2ss %rax, %xmm0
    cvtsi2ss %ebx, %xmm1
    cvtsi2sd %rax, %xmm2
    cvtsi2sd %ebx, %xmm3
    ret

/*
analizaremos los comandos:
cvtsi2ss que convierte un entero a un float
cvtsi2sd que convierte un entero a un double

al terminar el programa los valores de los registros son
xmm0 = {0x40400000, 0x0, 0x0, 0x0} = 3
xmm1 = {0x40800000, 0x0, 0x0, 0x0} = 4
xmm2 = {0x4008000000000000, 0x0} = 3
xmm3 = {0x4010000000000000, 0x0} = 4
es decir, convierten long y quad a flotantes.
con word/short (16 bits) y byte (8 bits) no se puede

*/