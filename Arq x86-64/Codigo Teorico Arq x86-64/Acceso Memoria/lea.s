/*
La instrucci ́on lea a menudo se usa como un “truco” para hacer ciertos c ́alculos,
aunque ese no sea su prop ́osito principal. Usando sintaxis AT&T, los modos de direccio-
namiento  ́utiles con lea son los siguientes:

1)
lea desplazamiento(%base), %dest
%dest = desplazamiento + %base
2)
lea (,% ́ındice, multiplicador), %dest
%dest = % ́ındice * multiplicador
3)
lea desplazamiento(, % ́ındice, multiplicador), %dest
%dest = desplazamiento + % ́ındice * multiplicador
4)
lea (%base, % ́ındice, multiplicador), %dest
%dest = %base + % ́ındice * multiplicador
5)
lea desplazamiento(%base, % ́ındice, multiplicador), %dest
%dest = desplazamiento + %base + % ́ındice * multiplicador
donde desplazamiento es una constante entera, multiplicador es 2, 4 u 8, y %dest,
%ındice y %base son registros.
*/
.data
b: .byte 1,2,3,4
w: .short 5,6,7,8
l: .long 9,10,11,12
q: .quad 13,14,15,16
.text
.global main
main:
    movq $1, %rax
    leaq b(%rax), %rbx # mueve la direccion b+1 a rbx (la direccion, no el contenido).
    movq $b, %rax # mueve la direccion de b a rax, si ponemos b solo mueve el contenido de la direccion a rax
    leaq 1(%rax), %rbx # idem instruccion leaq anterior.
    #########################################################################################################
    movq $2, %rax
    leaq b(, %rax, 1), %rbx #-> rbx contendra la direccion del elemento 3 de b (el 3)
    #########################################################################################################
    movq $2, %rax
    movq $b, %rcx
    leaq 4(%rcx, %rax, 2), %rbx #-> rbx contendra la direccion del elemento 3 de w (el 7)
    ret
