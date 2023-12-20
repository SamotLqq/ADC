.data
entero: .quad 0x1122334455667788
.text
.global main
main:
    movq $0x1122334455667788, %rax
    pushq %rax
    popq %rax
    ret
