.data
a: .byte 1
.text
.global main
main:
    movq $a, %rax
    ret

/*
Con estos comandos guardamos la direccion a la que apunta a en rax. podemos verificarlo con gdb haciendo
x &a, al costado nos saldrá en azul la dir de a y ejecutando i r rax deberia ser lo mismo.
*/