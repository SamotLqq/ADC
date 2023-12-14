.global main
main:
    movb $0xaa, %al #1010 1010
    stc
    rcrb $3, %al
    ret

/*
se extiende el campo de rotacion a [CF AL] lo que equivale a 9 posiciones
empieza en 1 1010 1010
si la rotacion es de 3 unidades
termina en 0 1011 0101 -> CF = 0 & al = 1011 0101 = 0xb5
*/