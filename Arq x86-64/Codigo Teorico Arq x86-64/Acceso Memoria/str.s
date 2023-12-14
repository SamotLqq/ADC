.data
i: .long 0
f: .double 3.14
str: .asciz "Hola mundo"
array: .byte 1,2,3,4,5,6,7,8
.bss
a: .quad
.text
.global main
main:
    movq $40, %rax # rax=40
    movl i, %ebx # ebx=0
    movq $-1, a # a=0xffffffffffffffff (-1)
    movq f, %rdx # rdx=0x40091eb851eb851f (3.14)
    movl str, %ecx # ecx=0x616c6f48 ("aloH")
    movq array, %rax
    retq

/*
Esta muy bien, como str y array son arreglos separados entonces los elementos se guardan de la sieguiente forma
str = H
str+1 = o
str+2 = l
...
str+8 = d
str+9 = o
str+10 = \0

array = 1
array+1 = 2
array+2 = 3
...
array+7 = 8

Es decir, cuando hay separaciones no se aplica endiannes ya que son datos distintos, endiannes es para datos individuales.
Pero luego mov si aplica endiannes entonces al unir queda, en el bit mas significativo, str+3(a) (por l como sufijo de mov)
y array+7(8) (por q como sufijo de mov) resp. asi hasta llegar a el bit menos significativo que quedara str(H) y array(1) resp.
*/