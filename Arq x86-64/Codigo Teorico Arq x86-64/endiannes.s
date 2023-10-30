.data
str: .asciz "hola mundo"
.text
.global main
main:
    movl $0x87654321, %eax
    pushq %rax
    pushq str
    popq %rax
    ret

/*
se puede ver con gdb que en la direccion rsp se aloja 0x21 en rsp+1 0x43 en rsp+2 0x65 y en rsp+3 0x87
*/