.global main
main:
    movb $0x10, %al #00010000
    movb $0xff, %bl #00000101
    movb $0xef, %cl #11101111
    testb %cl, %bl
    testb %al, %al
    testb %al, %cl
    ret
