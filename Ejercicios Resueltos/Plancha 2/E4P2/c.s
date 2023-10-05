/*
c) 11111111 11111111 11111111 00000000 == -1 & ~(0xFF)
*/

.global main
main:
    movl $-1, %eax
    movl $0xff, %ebx
    notl %ebx
    andl %ebx, %eax
    ret
