/*
h) 00000000 00000000 00000000 00000000 == 0x80000000 + 0x80000000
*/

.global main
main:
    movl $0x80000000, %eax
    movl $0x80000000, %ebx
    addl %ebx, %eax
    ret
