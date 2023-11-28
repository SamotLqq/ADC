.global main
main:
    movq $1, %rax
    movq $2, %rbx
    // ver valores actuales
    xchgl %eax, %ebx
    // ver valores intercambiados
    ret
# en este ejemplo también se puede observar que ensamblador es independiente de lo que se hizo antes en cada instrucción
# lo que permite flexibilidad pero hay que ser cuidadosos. en este caso se intercambiaron los 32 bits mas bajos
# de eax con ebx cuando habiamos asignado 64 bits con las operaciones mov.
