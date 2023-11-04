.data
cero: .float 0
neg: .float -1
.balign 16
.text
.global solve
solve:
    # prologo
    pushq %rbp
    movq %rsp, %rbp
    movq $-1, %rax
    # calculamos determinante de A y lo guardamos en xmm6
    movss %xmm0, %xmm6 # xmm6 = a
    mulss %xmm4, %xmm6 # xmm6 = a*e
    movss %xmm3, %xmm7 # xmm7 = d
    mulss %xmm1, %xmm7 # xmm7 = b*d
    subss %xmm7, %xmm6 # xmm6 = a*e - b*d = det(A)
    ucomiss cero, %xmm6 # xmm6 - 0
    jz epilogo # si la bandera zf esta en 1 es porque xmm6 - 0 = 0 es decir, xmm6 = 0 por lo que no hay solucion unica y terminamos.
    movq $0, %rax # caso contrario seteamos rax (retorno del programa) en 0 y calculamos la solucion.
    # definimos la matriz A⁻¹
    movss %xmm4, %xmm7 # xmm7 = e
    divss %xmm6, %xmm7 # xmm7 = e/det(A) = A⁻¹(1,1)
    movss %xmm1, %xmm8 # xmm8 = b
    mulss neg, %xmm8 # xmm8 = -b
    divss %xmm6, %xmm8 # xmm8 = -b/det(A) = A⁻¹(1,2)
    movss %xmm3, %xmm9 # xmm9 = d
    mulss neg, %xmm9 # xmm9 = -d
    divss %xmm6, %xmm9 # xmm9 = -d/det(A) = A⁻¹(2,1)
    movss %xmm0, %xmm10 # xmm10 = a
    divss %xmm6, %xmm10 # xmm10 = a/det(A) = A⁻¹(2,2)
    # obtenemos las soluciones del sistema
    # calculamos x
    movss %xmm7, %xmm11 # xmm11 = A⁻¹(1,1)
    mulss %xmm2, %xmm11 # xmm11 = A⁻¹(1,1)*b(1,1)
    movss %xmm8, %xmm12 # xmm12 = A⁻¹(1,2)
    mulss %xmm5, %xmm12 # xmm12 = A⁻¹(1,2)*b(2,1)
    addss %xmm12, %xmm11 # xmm11 = x = A⁻¹(1,1)*b(1,1) + A⁻¹(1,2)*b(2,1)
    # calculamos y
    movss %xmm9, %xmm13 # xmm13 = A⁻¹(2,1)
    mulss %xmm2, %xmm13 # xmm11 = A⁻¹(2,1)*b(1,1)
    movss %xmm10, %xmm14 # xmm12 = A⁻¹(2,2)
    mulss %xmm5, %xmm14 # xmm12 = A⁻¹(2,2)*b(2,1)
    addss %xmm14, %xmm13 # y = A⁻¹(2,1)*b(1,1) + A⁻¹(2,2)*b(2,1)
    # guardamos x e y en su direccion correspondiente.
    movss %xmm11, (%rdi)
    movss %xmm13, (%rsi)
    # epilogo
epilogo:
    movq %rbp, %rsp
    popq %rbp
    ret

/*
en el programa
A = [a b] 
    [d e]
al iniciar el programa (con el sistema cargado como ejemplo)
xmm0 = a coef 1,1 matriz A = 0x40000000 = 2.0 
xmm1 = b coef 1,2 matriz A = 0x3f800000 = 1.0
xmm2 = c coef 1,1 b = 0x40000000 = 2.0
xmm3 = d coef 2,1 matriz A = 0x40000000 = 2.0
xmm4 = e coef 2,2 matriz A = 0x0 = 0
xmm5 = f coef 2,1 b = 0x40000000 = 2.0
rdi = &x = 0x7fffffffddc8 y x/f 0x7fffffffddc8 = 10
rsi = &y = 0x7fffffffddcc y x/f 0x7fffffffddcc = 10
usaremos el siguiente metodo para resolver el sistema:
Ax = b <-> A⁻¹Ax = A⁻¹b <-> x = A⁻¹*b
para esto debemos conocer la forma general de A⁻¹ que esta dada por:
si
A = [a b]
    [c d]
entonces 
A⁻¹ = 1/det(A) * ADJ(A)
luego 

A⁻¹ = [d/det(A) -b/det(A)] = [d/(ad-bc) -b/(ad-bc)]
      [-c/det(A) a/det(A)] = [-c/(ad-bc) a/(ad-bc)]

y podemos usar el resultado que nos dice que el sistema Ax = b tiene solucion unica si y solo si det(A) != 0
asi que lo primero que haremos es calcular ad-bc si esto es 0 terminamos y retornamos -1, si es distinto a 0 cargamos 0 en rax y resolvemos el sistema mediante el metodo planteado.
*/