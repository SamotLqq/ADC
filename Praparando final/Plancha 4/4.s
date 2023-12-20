.text
.global main
main:
    @ logical shift right por default calculo
    MOV r7, #0x8c, 4 @ 10001100 >> 4 en 32 bits -> r7 = 0b1100...1000
    MOV r7, #0x42, 30 @ 01000010 >> 30 = 01000010 << 2 = 0...0100001000 = 0x108
    MVN r7, #2 @ r7 = 0xfffffffd
    MVN r7, #0x8c, 4 @ 0xffffff73 >> 4 -> r7 = 0x3ffffff7
    bx lr
