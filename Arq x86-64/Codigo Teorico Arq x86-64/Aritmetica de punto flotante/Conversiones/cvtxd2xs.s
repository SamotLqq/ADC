.data
x: .double 1.6, 3.2
.balign 16
.text
.global main
main:
    movsd x, %xmm0
    cvtsd2ss %xmm0, %xmm1
    movapd x, %xmm0
    cvtpd2ps %xmm0, %xmm1
    ret

/*
veremos dos instrucciones
cvtsd2ss que convierte un double a un float
cvtpd2ps que convierte 2 doubles a 2 floats

luego de ejecutar las instrucciones
movsd x, %xmm0
cvtsd2ss %xmm0, %xmm1
los valores en xmm0 y xmm1 son:

xmm0 = {0x3ff999999999999a, 0x0} = 1.6 aprox
xmm1 = {0x3fcccccd, 0x0, 0x0, 0x0} = 1.6 aprox

luego de ejecutar las instrucciones
movapd x, %xmm0
cvtpd2ps %xmm0, %xmm1
los valores en xmm0 y xmm1 son:

xmm0 = {0x3ff999999999999a, 0x400999999999999a} = {1.6, 3.2} aprox
xmm1 = {0x3fcccccd, 0x404ccccd, 0x0, 0x0} = {1.6, 3.2} aprox

la precision no se mantiene a la que nos da double, sino que baja a la de float simplemente porque no entran mas bits que aumenten la precision
*/