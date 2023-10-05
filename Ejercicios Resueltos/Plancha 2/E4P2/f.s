/*
f) 11111111 11111111 11111110 11111111 == -1 & (~(1 << 8))
*/

.global main
main:
    movl $-1, %eax
    movl $1, %ebx
    sall $8, %ebx
    notl %ebx
    andl %ebx, %eax
    ret
