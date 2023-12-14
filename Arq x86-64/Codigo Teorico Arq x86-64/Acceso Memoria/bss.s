.data
a: .quad 1
.bss
b: .quad
.text
.global main
main:
    movq a, %rax
    movq %rax, b
    movq b, %rcx
    ret
