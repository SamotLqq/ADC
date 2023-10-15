.global main
main:
    movq $0x8ffffffffffffff1, %rax
    rol $2, %rax
    ror $3, %rax
    ret
