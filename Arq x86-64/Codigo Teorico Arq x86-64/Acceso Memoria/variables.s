.data
var1: .byte 0x11
var2: .byte 0x22
var3: .word 0x3344
var4: .long 0x55667788
.text
.global main
main:
    movq var1, %rax
    movb var1, %al
    movb var2, %al
    movw var3, %ax
    movl var4, %eax
    ret

/* 
claro, en rax se guarda 0x5566778833442211 porque eso haria si var1 contuviera un quad, guardar desde var1+7 (55) en la posicion
mas significativa y var (11) en la menos significativa
asi tendriamos que el numero estaria bien armado pues
var = 0x11
var+1 = 0x22
var+2 = 0x44
var+3 = 0x33
var+4 = 0x88
var+5 = 0x77
var+6 = 0x66
var+7 = 0x55
y como se almacena con little endian el resultado correcto seria uniendo los bits de la siguiente forma
var+7 var+6 ... var+1 var = 0x5566778833442211
*/
