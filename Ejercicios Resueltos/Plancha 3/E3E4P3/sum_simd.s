.global sum_simd
sum_simd:
    #prologo
    pushq %rbp
    movq %rsp, %rbp
    movq %rdx, %rax
    xorq %rdx, %rdx
    movq $4, %rcx
    idivq %rcx # en rax el cociente y en rdx el resto.
    movq %rax, %rcx # longitud del bucle de instrucciones SIMD en rcx
L1:
    subq $1, %rcx
    movq $2, %r10 # r10 = 2
    imulq %rcx, %r10 # r10 = 2*i
    leaq (%rdi, %r10, 8), %r8 # rdi+i*16 = direccion del paquete i-esimo de a
    leaq (%rsi, %r10, 8), %r9 # rsi+i*16 = direccion del paquete i-esimo de b
    movups (%r8), %xmm0 # movemos el paquete i-esimo de a a xmm0 
    movups (%r9), %xmm1 # movemos el paquete i-esimo de b a xmm1 (no encontramos la forma de sumar los paquetes desde las direcciones directamente, creemos que la direccion de memoria debe estar alineada a 16 bytes para que esto sea posible)
    addps %xmm1, %xmm0 # sumamos los paquetes
    movups %xmm0, (%r8) # guardamos la suma empaquetada en rdi+i*16 = direccion del paquete i-esimo de a.
    addq $1, %rcx # actualizamos rcx.
    loop L1 # cociente iteraciones de instrucciones simd
    movq %rdx, %rcx # longitud del bucle de instrucciones escalares en rcx
    subq $0, %rcx # si el resto es 0 que termine.
    jz fin
L2: # inicio bucle de instrucciones escalares (sumamos las ultimas resto posiciones)
    subq $1, %rcx # corregimos indice.
    movq $2, %r10 # r10 = 2
    imulq %rax, %r10 # r10 = 2*cociente
    movq $4, %r11
    imul %rcx, %r11
    leaq (%rdi,%r10,8), %r8 # r8 = rdi + 16*cociente 
    addq %r11, %r8 # r8 = rdi + 16*cociente + 4*rcx
    leaq (%rsi,%r10,8), %r9 # r9 = rsi + 16*cociente
    addq %r11, %r9 # r9 = rsi +16*cociente + 4*rcx
    movss (%r8), %xmm0 
    movss (%r9), %xmm1
    addss %xmm1, %xmm0 # sumamos el elemento i-esimo de b al elemento i-esimo de a y lo guardamos en xmm0.
    movss %xmm0, (%r8) # guardamos la suma en la direccion i-esima de a.
    addq $1, %rcx # actualizamos rcx.
    loop L2 # resto iteraciones de instrucciones escalares.
    #epilogo
fin:

    movq %rbp, %rsp
    popq %rbp
    ret


/*
Al iniciar el programa
rdi = a (la direccion de memoria donde empieza el arreglo de flotantes a)
rsi = b (la direccion de memoria donde empieza el arreglo de flotantes b)
rdx = len (el valor de len, no la direccion, en el ejemplo 9)
como usaremos instrucciones SIMD en flotantes para las sumas esto significa
que sumaremos de a 4 elementos en paralelo por lo que la cantidad de iteraciones
se reduce a len/4 + resto donde las primera len/4 iteraciones utilizan instrucciones simd
y las ultimas resto operaciones utilizan instrucciones escalares.
por lo tanto guardaremos
len/4 en rcx y el resto en rdx

*/