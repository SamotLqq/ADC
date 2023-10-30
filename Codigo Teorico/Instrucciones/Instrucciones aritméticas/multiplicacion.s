.global main
main:
    movq $0xffffffffffffffff, %rdx
    movl $0x2, %ecx
    movl $0xffffffff, %eax
    imull %ecx
    // el resultado queda guardado en edx:eax inicializando los demas bits (de rdx:rax) en 0.
    movq $0xffffffffffffffff, %rdx
    movw $0x2, %cx
    movw $0xffff, %ax
    imulw %cx
    // el resultado queda guardado en dx:ax, no inicializa los demas bits en 0.
    movw $2, %cx
    movw $2, %ax
    imulw %ax, %cx
    // el resultado queda guardado en cx, no inicializa los demas bits en 0.
    movq $2, %rax
    imulq $5, %rbp, %rcx
    // primer argumento valor inmediato, segundo argumento registro o direccion de memoria, tercer argumento registro o direccion de memoria. resultado guardado en tercer argumento.
    movq $0xffffffffffffffff, %rax
    movq $4, %rbx
    mulq %rbx 
    # rax=0xfffffffffffffffc y rdx=3
    ret

/*
observacion: no admite sufijo b, es decir se puede operar con 16 o mas bits.
*/