.data
x: .float 3.6 # 0x40666666 en ieee754 simple precision
y: .double 3.4 # 0x400B333333333333 en ieee754 double precision
.balign 16
.text
.global main
main:
    movss x, %xmm0
    cvtss2si %xmm0, %eax
    cvtss2si %xmm0, %rbx
    movsd y, %xmm1
    cvtsd2si %xmm1, %eax
    cvtsd2si %xmm1, %rbx
    ret

/*
veremos dos instrucciones
cvtss2si que convierte un float a un quad 64 o a un long 32
cvtsd2si que convierte un double a un qued 64 o a un long 32
aplican redondeo.

luego de ejecutar las instrucciones
    movss x, %xmm0
    cvtss2si %xmm0, %eax
    cvtss2si %xmm0, %rbx
los valores en eax y rbx son:
eax = 4
rbx = 4

luego de ejecutar las instrucciones
    movsd y, %xmm1
    cvtsd2si %xmm1, %eax
    cvtsd2si %xmm1, %rbx
los valores en eax y rbx son:
eax = 3
rbx = 3

si cambiamos los comandos cvtsx2si por cvttsx2si
cambiamos redondeo por truncado

luego de ejecutar las instrucciones
    movss x, %xmm0
    cvttss2si %xmm0, %eax
    cvttss2si %xmm0, %rbx
los valores en eax y rbx son:
eax = 3
rbx = 3

luego de ejecutar las instrucciones
    movsd y, %xmm1
    cvttsd2si %xmm1, %eax
    cvttsd2si %xmm1, %rbx
los valores en eax y rbx son:
eax = 3
rbx = 3

*/