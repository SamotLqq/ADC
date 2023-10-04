/*
of = 0 cf = 1. 
n3 = 11000001 = -63
n4 = 11001000 = -56
s2 = n3 + n4 = 11000001
              +
               11001000
               --------
               10001001 = -119
*/
.global main
main:
    movb $0b11000001, %al
    movb $0b11001000, %bl
    addb %al, %bl
    ret
