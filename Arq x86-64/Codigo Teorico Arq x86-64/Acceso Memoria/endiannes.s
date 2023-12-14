.data
a: .long 0xfedcba98
.text
.global main
main:
    pushq a
    popq a
    ret
