.global main
main:
    movq $0x2, %rcx
    xorq %rdx, %rdx
    movq $0xffffffffffffffff, %rax
    imulq %rcx
    ret
/*
el resultado de esto se guarda en rdx:rax y es -2
rdx = 0xffffffffffffffff
rax = 0xfffffffffffffffe
*/