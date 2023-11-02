.data
xs: .float 1.6
ys: .float 1.6, 1.7
xd: .double 3.2
yd: .double 3.2, 3
.balign 16
.text
.global main
main:
    movss xs, %xmm0
    movss ys+4, %xmm1 # nos permite verificar con gdb que ys+4 sea 1.7
    movsd yd+8, %xmm2 # nos permite verificar con gdb que yd+8 sea 3
    ucomiss ys, %xmm0
    ucomiss ys+4, %xmm0
    movsd xd, %xmm0
    ucomisd yd, %xmm0
    ucomisd yd+8, %xmm0
    ret

/*
realiza la resta entre los operandos
    ucomiss ys, %xmm0 prende zf ya que 1.6 - 1.6 = 0
    ucomiss ys+4, %xmm0 prende cf ya que 1.6 - 1.7 en binario (ieee754) realiza acarreo. habria que ver la cantidad de 1 que deja la cuenta para ver la pf.
    ucomisd yd, %xmm0 prende zf ya que 1.6 - 1.6 = 0
    ucomisd yd+8, %xmm0 no prende nada ya que 3.2 - 3 no tiene acarreo en binario (ieee754). habria que ver la cantidad de 1 que da la cuenta para justificar la parity flag.


*/