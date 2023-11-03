.global sum
sum:
    #prologo
    pushq %rbp
    movq %rsp, %rbp
    movq %rdx, %rcx # guardamos len en rcx para hacer loop.
E1:
    subq $1, %rcx # corregimos indice.
    leaq (%rdi,%rcx,4), %r8 # direccion del elemento i-esimo de a en r8
    leaq (%rsi,%rcx,4), %r9 # direccion del elemento i-esimo de b en r9
    movss (%r8), %xmm0 # el valor i-esimo de a en xmm0
    movss (%r9), %xmm1 # el valor i-esimo de b en xmm1
    addss %xmm1, %xmm0 # sumamos el elemento i-esimo de b al elemento i-esimo de a y lo guardamos en xmm0.
    movss %xmm0, (%r8) # guardamos la suma en la direccion i-esima de a.
    addq $1, %rcx # actualizamos rcx.
    loop E1
    #epilogo
    movq %rbp, %rsp
    popq %rbp
    ret


/*
Al iniciar el programa
rdi = a (la direccion de memoria donde empieza el arreglo de flotantes a)
rsi = b (la direccion de memoria donde empieza el arreglo de flotantes b)
rdx = len (el valor de len, no la direccion, en el ejemplo 8)
La direccion del elemento i-esimo de a estará dada por:
rdi+i*4
La direccion del elemento i-esimo de b estará dada por:
rsi+i*4

Observación: se podria mejorar la eficiencia eliminando la correcion de indice y la actualizacion de rcx a costo de un codigo menos limpio.
ya que si lo hacemos con loop, la suma de los elementos del indice 0 la tendriamos que hacer al terminar la iteracion.
y si no lo hacemos con loop el codigo también se pondria mas engorroso.

*/

