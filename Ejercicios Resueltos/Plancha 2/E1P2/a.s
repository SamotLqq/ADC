# como codigo de salida devuelve 255 en decimal con echo y 377 en octal con gdb.
# al hacer las cuentas 3*64 + 7*8 + 7 = 255 y tenemos que el retorno es el mismo en ambos casos.
.global main
main:
    movb $0xFF, %al # mueve el valor inmediato 0xFF al registro al
    ret

