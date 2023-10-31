.data
x: .float 1.6, 3.2, 6.4, 12.8
y: .double 2, 2.5
z: .float 0,0,0,0
.text
.global main
main:
    movups x, %xmm0
    movups %xmm0, z
    movups y, %xmm1
    movups %xmm1, z
    ret

/*
obs:
x = 0x3fcccccd = 1.6 (ieee756 32)
x+4 = 0x404ccccd = 3.2 (ieee756 32)
x+8 = 0x40cccccd = 6.4 (ieee756 32)
x+12 = 0x414ccccd = 12.8 (ieee756 32)
y (x+16) = 0x4000000000000000 = 2 (ieee756 64)
y + 8 (x + 24) = 0x4004000000000000 = 2.5 (ieee756 64)
z = 0
z + 4 = 0
z + 8 = 0
z + 12 = 0

luego de la primera instruccion (movups x, %xmm0):
xmm0 = v4_float = {0x3fcccccd, 0x404ccccd, 0x40cccccd, 0x414ccccd}

luego de la segunda instruccion (movups %xmm0, z):
z = 0x3fcccccd = 1.6 (ieee756 32)
z + 4 = 0x404ccccd = 3.2 (ieee756 32)
z + 8 = 0x40cccccd = 6.4 (ieee756 32)
z + 12 = 0x414ccccd = 12.8 (ieee756 32)

luego de la tercera instruccion (movups y, %xmm1)
xmm1 = v2_double = {0x4000000000000000, 0x4004000000000000}

y por último, luego de la cuarta instruccion (movups %xmm1, z)
z = 0x4000000000000000 = 2 (ieee756 64)
z + 8 = 0x4004000000000000 = 2.5 (ieee756 64)
*/