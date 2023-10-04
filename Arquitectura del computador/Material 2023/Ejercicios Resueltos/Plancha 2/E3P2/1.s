/* 
of = 1 cf = 0. 
n1 = 100 = 0b01100100
n2 = 120 = 0b01111000
s1 = n1 + n2 = 01100100
              +
               01111000
               --------
               11011100 = -36
*/
.global main
main:
    movb $0b01100100, %al
    movb $0b01111000, %bl
    addb %al, %bl
    ret
