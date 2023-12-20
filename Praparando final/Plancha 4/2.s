.data
slot: .word 0,5,0,512,0,0,12,0,0,0
.text
.global main
main:
    @ ejecutamos las instrucciones solicitadas (no se puede ya que no tenemos permiso a la direccion 0x8000)
    @STR r6, [r3, #12]
    @luego de esta instruccion, se guardaria en la direccion (0x8000)_16 + (12)_10 el valor que tiene r6 actualmente, ningun registro se ve modificado.
    @STRB r7, [r3], #4
    @se guardan los 8 bits menos significativo de r7 en la direccion que apunta r3(0x8000) y se actualiza r3 con el valor r3+4 = 0x8000_16 + 4_10
    @LDRH r5, [r3], #8
    @se guarda en r5 los 16 bits menos significativos de la direccion almacenada en r3 y se actualiza r3 con el valor r3+8 = 0x8000_16 +4_10 + 8_10
    @LDR r12, [r3, #12]!
    @se guarda en r12 el valor que apunta la direccion almacenada en r3+12 y se actualiza r3 con ese valor (r3+12), ie, r3 = r3+12 = 0x8000_16+4_10+8_10+12_10
    @ analogia
    ldr r3, =slot
    mov r6, #0x10000004
    mov r7, #0x40000001
    @a)
    STR r6, [r3, #12]
    @b)
    STRB r7, [r3], #4
    @c)
    LDR r5, [r3], #8
    @d)
    LDR r12, [r3, #12]!
    bx lr

