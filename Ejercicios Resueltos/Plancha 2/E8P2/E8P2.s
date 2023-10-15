.data
format: .asciz "%ld\n"
format2: .asciz "%x\n"
i: .quad 0xDEADBEEF
.text
.global main
main:
    movq $format, %rdi # El primer argumento es el formato.
    movq $1234, %rsi # El valor a imprimir.
    xorq %rax, %rax # Cantidad de valores de punto flotante.
    pushq %rbp # Alineamos el stack
    call printf
    popq %rbp # Desapilamos para preservar el valor de rsp

    # imprimimos rsp
    movq $format, %rdi # volvemos a mover el formato al primer argumento ya que no es preservado.
    movq %rsp, %rsi # El valor a imprimir
    xorq %rax, %rax # Cantidad de valores de punto flotante.
    pushq %rbp # Alineamos el stack
    call printf
    popq %rbp # Desapilamos para preservar el valor de rsp

    # imprimimos la direccion de la cadena de formato
    movq $format, %rdi # volvemos a mover el formato al primer argumento ya que no es preservado.
    movq $format, %rsi # El valor a imprimir
    xorq %rax, %rax # Cantidad de valores de punto flotante.
    pushq %rbp # Alineamos el stack
    call printf
    popq %rbp # Desapilamos para preservar el valor de rsp

    # imprimimos la direccion de la cadena de formato
    movq $format, %rdi # volvemos a mover el formato al primer argumento ya que no es preservado.
    movq $format, %rsi # El valor a imprimir
    xorq %rax, %rax # Cantidad de valores de punto flotante.
    pushq %rbp # Alineamos el stack
    call printf
    popq %rbp # Desapilamos para preservar el valor de rsp

    # imprimimos la direccion de la cadena de formato en hexa
    movq $format2, %rdi # El primer argumento es el formato.
    movq $format, %rsi # El valor a imprimir
    xorq %rax, %rax # Cantidad de valores de punto flotante.
    pushq %rbp # Alineamos el stack
    call printf
    popq %rbp # Desapilamos para preservar el valor de rsp

    # imprimimos el tope de la pila
    movq $format, %rdi # volvemos a mover el formato al primer argumento ya que no es preservado.
    movq %rsp, %rsi # El valor a imprimir
    xorq %rax, %rax # Cantidad de valores de punto flotante.
    pushq %rbp # Alineamos el stack
    call printf
    popq %rbp # Desapilamos para preservar el valor de rsp

    # imprimimos el quad ubicado en rsp + 8
    movq $format, %rdi # volvemos a mover el formato al primer argumento ya que no es preservado.
    movq 8(%rsp), %rsi # El valor a imprimir
    xorq %rax, %rax # Cantidad de valores de punto flotante.
    pushq %rbp # Alineamos el stack
    call printf
    popq %rbp # Desapilamos para preservar el valor de rsp

    # imprimimos el valor de i
    movq $format, %rdi # volvemos a mover el formato al primer argumento ya que no es preservado.
    # El valor a imprimir
    movq $i, %rsi 
    movq (%rsi), %rsi
    xorq %rax, %rax # Cantidad de valores de punto flotante.
    pushq %rbp # Alineamos el stack
    call printf
    popq %rbp # Desapilamos para preservar el valor de rsp

    # imprimimos la direccion de i
    movq $format, %rdi # volvemos a mover el formato al primer argumento ya que no es preservado.
    movq $i, %rsi  # El valor a imprimir
    xorq %rax, %rax # Cantidad de valores de punto flotante.
    pushq %rbp # Alineamos el stack
    call printf
    popq %rbp # Desapilamos para preservar el valor de rsp


    ret
