.data
x1: .float 1, 2, 3, 4
x2: .float 1.5, 2.5, 3.5, 4.5
y1: .double 3.89, 4.11
y2: .double 3.11, 4.89
.balign 16
.text
.global main
main:
    movaps x1, %xmm0
    movapd y1, %xmm1
    # sumamos mediante simd x1[i] + x2[i] e y2[i] + y2[i], i E [1,2,3,4]
    addps x2, %xmm0
    addpd y2, %xmm1
    ret

/*
al terminar:
xmm0: {0x40200000, 0x40900000, 0x40d00000, 0x41080000} = {2.5, 4.5, 6.5, 8.5}
xmm1: {0x401c000000000000, 0x4022000000000000} = {7, 9}
check
*/