.data
b: .byte 1,2,3,4
w: .short 5,6,7,8
l: .long 9,10,11,12
q: .quad 13,14,15,16
.text
.global main
main:
    ############################################################################################## 1
    movq $24, %rax
    movb %al, b # se puede poner como destino una etiqueta.
    movb %al, b+1 # se puede poner como destino una etiqueta operada con suma.
    movb %al, b+1*2 # se puede poner como destino una etiqueta operada con suma y producto.
    ############################################################################################## 2
    movq 0x404028, %rax # se puede cargar datos de direcciones de memoria validas con valores inmediatos, puede generar seg fault si no es valida.
    movb b+1*2, %al # se puede operar el operador fuente con suma y producto si es etiqueta
    movq 0x404028+1*2, %rax # se puede operar el operador fuente con suma y producto si es etiqueta
    movq 0x40402a, %rax # operando 1 equivalente a la inmediata arriba (para verificar que guardan lo mismo en rax)
    ############################################################################################## 3
    movq $0x40402a, %rax # movemos la direccion con la que estabamos jugando a rax
    movb $100, (%rax) # movemos 2 a la direccion 0x40402a
    movq (%rax), %rbx # movemos 2 a rbx
    movq %rax, %rbx # movemos la direccion con la que jugabamos a rbx
    ############################################################################################## 4
    movq $3, %rax
    movb b(%rax), %bl # mueve el valor en la direccion de memoria b+%rax, donde b es la base (dir) y rax el desplazamiento -> bl = 4
    movq $6, %rax
    movw w(%rax), %bx # mueve el valor en la direccion de memoria w+%rax, donde w es la base (dir) y rax el desplazamiento -> bx = 8
    movq $12, %rax
    movl l(%rax), %ebx #mueve el valor en la direccion de memoria l+%rax, donde l es la base (dir) y rax el desplazamiento -> ebx = 12
    movq $24, %rax
    movq q(%rax), %rbx # rbx = 16
    ############################################################################################## 5
    # sabemos que w esta a 4 bytes de b, ie, w = b+4. ademas cada elementos de w mide 2 bytes. accederemos al tercer elemento de w a partir de b
    movq $b, %rax
    movq $2, %rcx
    movw 4(%rax, %rcx, 2), %bx # -> bx = 7
    ############################################################################################## 6
    # b = 24 24 100 4
    movb (%rax, %rcx, 1), %bl # -> bl = rax + rcx*1 = b+2 = 100 (el tercer elemento de b)
    movl l(, %rcx,4), %ebx # -> ebx = l+rcx*4 = l+8 = 11 (el tercer elemento de l)
    movq q(, %rcx,8), %rbx # -> rbx = q+rcx*8 = q+16 = 15 (el tercer elemento de q)
    ret


/*
En 4 ejemplificamos usando etiquetas como base y registros como indice, si queremos usar registros como base necesitaremos usar valores inmediatos como desplazamineto.
Son las unicas dos formas base/index
En 5 podemos ver que si tenemos un direccionamiento dentro de otro podemos usar ese formato relativo.
En 6 podemos ver que el formato relativo lo podemos cambiar para simplificar los numeros magicos de 4. Es decir, que las multiplicaciones que se realizan para desplazarnos sean mas explicitas.
*/