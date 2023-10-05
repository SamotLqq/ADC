/*
b) 10000000 00000000 10000000 00000000 == (1 << 15) | (1 << 31)
*/

.global main
main:
    movl $1, %eax
    movl $1, %ebx
    sall $15, %eax
    sall $31, %ebx
    orl %ebx, %eax
    ret
