.data
x: .float 1.6, 3.2, 0, 0
.balign 16
.text
.global main
main:
    movss x, %xmm0
    cvtss2sd %xmm0, %xmm1
    movaps x, %xmm0
    cvtps2pd %xmm0, %xmm1
    ret

/*
veremos dos instrucciones
cvtss2sd que convierte un float a un double
cvtss2pd que convierte 2 floats a 2 doubles

luego de ejecutar las instrucciones
movss x, %xmm0
cvtss2sd %xmm0, %xmm1
los valores en xmm0 y xmm1 son:

xmm0 = {0x3fcccccd, 0x0, 0x0, 0x0} =  aprox 1.6
xmm1 = {0x3ff99999a0000000, 0x0} = aprox 1.6 (misma aproximacion que en float, no mejora la aproximacion a double, solo extiende la aproximacion de float a double)

luego de ejecutar las instrucciones
movss x, %xmm0
cvtss2sd %xmm0, %xmm1
los valores en xmm0 y xmm1 son:

xmm0 = {0x3fcccccd, 0x404ccccd, 0x0, 0x0} = aprox {1.6, 3.2}
xmm1 = {0x3ff99999a0000000, 0x40099999a0000000} = aprox {1.6, 3.2} la misma que con float
*/


