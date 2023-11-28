.global main
main:
    movb $0x10, %al
    movb $0xff, %bl
    movb $0xef, %cl
    testb %cl, %bl
    testb %al, %al
    testb %al, %cl
    ret
