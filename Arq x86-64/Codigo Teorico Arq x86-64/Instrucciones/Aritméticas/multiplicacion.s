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
    movw $0xffff, %ax
    imulw $0x0010, %ax, %cx
    // primer argumento valor inmediato, segundo argumento registro o direccion de memoria, tercer argumento registro o direccion de memoria. resultado guardado en tercer argumento.
    movq $0xffffffffffffffff, %rax
    movq $4, %rbx
    mulq %rbx 
    # rax=0xfffffffffffffffc y rdx=3
    ret

/*
observacion: no admite sufijo b, es decir se puede operar con 16 o mas bits.


obs: esto de guardar en dos registros una multiplicacion es por si se multiplican los dos numeros mas grandes
almacenables en cada direccion, esto, dara un resultado del doble de tamaño. por ejemplo:
si multiplicamos 2⁸-1 * 2⁸-1 el resultado es 2¹⁶ - 2⁹ + 1 que debe ser guardado en 16 bits.

Caso 1 solo operando:
si se opera con 64 bits se almacena en rdx:rax
si se opera con 32 bits se almacena en edx:eax
si se opera con 16 bits se almacena en ex:ax
si se opera con 8 bits se almacena en ah:al

Caso 2 operandos:
se multiplica el primer operando con el segundo y se guarda en el segundo. en caso que el resultado exceda el tamaño 
con el que se opera entonces se trunca.
compatible con 64, 32 y 16 bits

Caso 3 operandos:
Se multiplica el primer con el segundo operando y se guarda en el tercero. en caso que el resultado exceda el tamaño
con el que se opera entonces se trunca.
compatible con 64, 32 y 16 bits

obs: al truncar guarda la parte baja de la multiplicacion, ie, si el resultado es 10101011110000 y tenemos que truncar a 8 bits 
entonces el resultado truncado es 11110000

lo unico que cambia con mul es que setea la overflow flag, el resultado a nivel bits es igual.
*/