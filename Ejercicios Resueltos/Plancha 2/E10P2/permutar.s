.global main
main:
    movq $0x1234567887654321, %rax
    rol $32, %rax
    ret
