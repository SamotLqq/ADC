.global main
main:
    movb $0xFE, %al # mueve FE a el registro al -> al = 0xFE
    movb $-1, %bl # mueve -1 al registro bl -> bl = 0xFF
    addb %bl, %al # le suma bl a al -> al = 0xFD
    incb %bl # incrementa en 1 a bl -> bl = 0x0
    ret

# como codigo de salida devuelve 253 en decimal con echo y 375 en octal con gdb.
# al hacer las cuentas 3*64 + 7*8 + 5 = 253 y tenemos que el retorno es el mismo en ambos casos.