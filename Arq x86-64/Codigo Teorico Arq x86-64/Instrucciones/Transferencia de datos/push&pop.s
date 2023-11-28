.global main
main:
    movq $1, %rax
    // aqui ver valor actual de rsp
    pushq %rax
    // aqui ver cambios de rsp (efectivamente es el valor anterior menos 8 que es la cantidad de bytes que representa q)
    // aqui ver valor actual de rbx
    popq %rbx
    // aqui ver cambios en rbx y rsp (rsp vuelve a su valor al empezar el programa y rbx toma el valor que estaba en el tope de la pila)
    ret

