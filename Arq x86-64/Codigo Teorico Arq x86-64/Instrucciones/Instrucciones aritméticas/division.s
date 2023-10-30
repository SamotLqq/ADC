.global main
main:
    movq $-1, %rdx
    movq $-1, %rax
    movq $2, %rcx
    idivq %rcx
    // resto rdx = -1 y cociente rax = 0
    ret
