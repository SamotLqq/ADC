.global main
main:
    xorq %rax, %rax
    movq $10, %rcx
    bucle:
        incq %rax
        loop bucle
    ret


