.data
x: .double 1.5
.balign 16
.text
.global convert
convert:
    # prologo
    pushq %rbp
    movq %rsp, %rbp
    # xmm0 = f
    movsd x, %xmm1 # xmm1 = 1.5
    cvtsi2sd %rdi, %xmm2 # xmm2 = c
    mulsd %xmm1, %xmm0 # xmm0 = f*1.5
    addsd %xmm2, %xmm0 # xmm0 = f*1.5 + c
    # epilogo
    movq %rbp, %rsp
    popq %rbp
    # retorno guardado en xmm0 asi que ya podemos terminar.
    ret

/*
al empezar la funcion con argumentos f = 3.5, c = 32:
xmm0 = {0x400c000000000000, 0x0} = 3.5
rdi = 32
al pasar los argumentos y ctes a los registros xmmi
xmm0 = 3.5
xmm1 = 1.5
xmm2 = 32
al realizar la multiplicacion y la suma
xmm0 =  = 3.5*1.5 + 32 = 37.5
xmm1 = 1.5
xmm2 = 32
*/