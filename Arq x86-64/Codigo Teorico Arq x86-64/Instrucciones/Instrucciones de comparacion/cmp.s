.global main
main: 
    movb $1, %al
    movb $2, %bl
    cmpb %al, %bl
    cmpb %bl, %al
    cmpb %bl, %bl
    cmpb %al, %al
    ret

/* obs
la instruccion cmpS arg1, arg2 ejecuta la instruccion arg2 - arg1 y hace seteo de banderas. arg1 y arg2 no son modificados.
*/