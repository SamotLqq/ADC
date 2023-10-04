.data

a: .quad 0x1122334455667788
b: .byte 56
c: .long 300

.text
.global main

d: .quad 0xbeef
main:

        movq a, %rax
        movq $a, %rax
        leaq a, %rax
        movw b, %ax
        movq d, %rax
        movq $45, %rdi
        movq $56, %rsi
        call suma
        retq
