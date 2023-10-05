/*
g) 11111111 11111111 11111111 11111111 == 0 - 1
*/

.global main
main:
    movl $0, %eax
    movl $1, %ebx
    subl %ebx, %eax
    ret
