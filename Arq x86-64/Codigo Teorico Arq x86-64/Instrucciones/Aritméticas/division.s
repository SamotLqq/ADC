.global main
main:
    movb $0x00, %ah # 00000000
    movb $0x04, %al # 00001000 -> ahal = 0b 00000000 0000000 = 4
    movb $2, %cl
    idivb %cl
    // resto ah = 0 y cociente al = 2
    ret

# admite operando de todos los tamaños (q, l, w, b)
# q: toma el valor de rdx:rax y lo divide por el operando. guarda el resto en rdx y el cociente en rax.
# l: toma el valor de edx:eax y lo divide por el operando. guarda el resto en edx y el cociente en eax
# w: toma el valor de dx:ax y lo divide por el operando. guarda el resto en dx y el cociente en ax
# b: toma el valor de ah:al y lo divide por el operando. guarda el resto en ah y el cociente en al
# lo unico que cambia con div es que setea la overflow flag, el resultado a nivel bits es igual