# También se puede lograr con corrimientos
.globl main
main:
    movl $-1,%eax # Solo para este tama~no el mov pone en 0
    # la parte alta del registro.
    movl $2, %ecx
    imull %ecx
    #completar para que el resultado correcto como signed quede en rax
    cdqe
    # inicializamos rax.
    xorq %rax,%rax
    movw $-1,%ax
    movw $2, %cx
    mulw %cx
    #completar para que el resultado correcto como unsigned int
    #quede en eax
    movzwl %ax, %eax
    ret

