#include <stdio.h>

// 1) A continuacion se presentan ciertos numeros enteros expresados en binario utilizando 32
// bits y a su derecha, expresiones en lenguaje C incompletas. Complete estas expresiones de forma
// que la igualdad sea cierta. Utilice operadores de bits, operadores enteros y constantes de enteros
// literales segun considere necesario.
// a) 10000000 00000000 00000000 00000000 == 1 << 31
// b) 10000000 00000000 10000000 00000000 == (1 << 31) | (1 << 15)
// c) 11111111 11111111 11111111 00000000 == -1 & -256
// d) 10101010 00000000 00000000 10101010 == 0xAA | (0xAA << 24)
// e) 00000000 00000000 00000101 00000000 == 5 << 8 == 0101 << 8
// f) 11111111 11111111 11111110 11111111 == -1 & (~ (1 << 8))
// g) 11111111 11111111 11111111 11111111 == 0 - 1
// h) 00000000 00000000 00000000 00000000 == 0x80000000 + 0x80000000 == 10000000 00000000 00000000 00000000 + 10000000 00000000 00000000 00000000

// obs si el desplazamiento corre en tiempo cte cte en proce entonces la funcion corre en tiempo lineal.
// si el desplazamiento corre en tiempo lineal en proce (peor no puede ser) la funcion corre en tiempo cuadratica.

int main () {
    int a = 1 << 31;
    int b = (1 << 31) | (1 << 15);
    int c = -1 & -256;
    int d = 0xAA | (0xAA << 24);
    int e = 5 << 8;
    int f = -1 & (~ (1 << 8));
    int g = 0 - 1;
    int h = 0x80000000 + 0x80000000;

    printf("a: %x\n", a);
    printf("b: %x\n", b);
    printf("c: %x\n", c);
    printf("d: %x\n", d);
    printf("e: %x\n", e);
    printf("f: %x\n", f);
    printf("g: %x\n", g);
    printf("h: %x\n", h);

    return 0;
}