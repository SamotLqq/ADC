.data
var1: .word 0xBEEFFACE
.bss
ubi1: .word
.text
.global main
main:
    @movemoos el valor a r6 y una direccion valida a r3 (ya que 0x8000 no es valida) 
    ldr r6, =var1
    ldr r6, [r6]
    ldr r3, =ubi1
    @ realizamos las op
    STR r6, [r3] @ cargamos a la direccion a la que apunta r3 (0x8000) el valor que se encunetra en la direccion var1 (0xBEEFFACE)
    LDRB r4, [r3] @ cargamos el byte mas bajo de la direccion de memoria que apunta r3 (apunta a 0x8000 y el valor dEL byte mas bajo seria 0xCE en big endian y 0xBE en little endian)
    @ por lo tanto r4 = 0xCE si trabajamos con big o r4 = 0xBE si trabajamos con big
    bx lr
