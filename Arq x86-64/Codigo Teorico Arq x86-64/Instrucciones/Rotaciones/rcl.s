.global main
main:
    movb $0xaa, %al #1010 1010
    stc
    rclb $3, %al
    ret

/*
se extiende el campo de rotacion a [AL CF] lo que equivale a 9 posiciones
empieza en 1010 1010 1
si la rotacion es de 3 unidades
termina en 0101 0110 1 -> CF = 1 & al = 0101 0110 = 0x56
*/
