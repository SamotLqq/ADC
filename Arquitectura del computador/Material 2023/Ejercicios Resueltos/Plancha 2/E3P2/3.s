/*
of = 1 cf = 1. 
n3 = 11000001 = -63
n5 = 10100101 = -91
s3 = n3 + n5 = 11000001
              +
               10100101
               --------
               01100110 = 102
*/
.global main
main:
    movb $0b11000001, %al
    movb $0b10100101, %bl
    addb %al, %bl
    ret
