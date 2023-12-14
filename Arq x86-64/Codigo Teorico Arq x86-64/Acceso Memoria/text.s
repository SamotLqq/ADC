.data
a: .quad 1
.text
.global main
main:
    movq a, %rax
    ret
