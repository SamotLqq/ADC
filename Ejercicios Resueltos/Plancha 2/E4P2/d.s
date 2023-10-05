/*
d) 10101010 00000000 00000000 10101010 == 0xAA | (0xAA << 24)
*/
.global main
main:
    movl $0xAA, %eax
    movl $0xAA, %ebx
    sall $24, %ebx
    orl %ebx, %eax
    ret
