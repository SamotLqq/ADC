.data
x1: .float 2.7
x2: .float 2.3 
y1: .double 3.5
y2: .double 4.5
.balign 16
.text
.global main
main:
    movss x1, %xmm0
    movsd y1, %xmm1
    # sumamos x2 e y2 a x1 e y1 resp
    addss x2, %xmm0
    addsd y2, %xmm1
    ret

/*
al finalizar:
xmm0 = v4_float = {0x40a00000, 0x0, 0x0, 0x0} = {5,0*3}
xmm1 = v2_double = {0x4020000000000000, 0x0} = {8,0}
check
*/
