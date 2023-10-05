#include <stdio.h>

/*
4) Implemente una funcion que tome tres parametros a, b y c y que rote los valores de las
variables de manera que al finalizar la funcion el valor de a se encuentre en b, el valor de b en c
y el de c en a. Evitar utilizar variables auxiliares. Ayuda: Tener en cuenta las propiedades del
operador XOR. 

Ayuda para el Ejercicio 4 de la Plancha 1
Se puede pensar primero en intercambiar dos variables:
x = x ^ y;
y = x ^ y;// pero ahora x = x ^ y, entonces y = x ^ y ^ y = x 
x = x ^ y;// x = x ^ y ^x = y
Luego se puede extender a tres variables.
*/

void intercambiador_dos_xor(int* x, int* y) {
    *x = *x ^ *y;
    *y = *x ^ *y;
    *x = *x ^ *y;
}

void intercambiador_tres_xor(int* x, int* y, int* z) {
    intercambiador_dos_xor(x,y);
    // ahora xActual = yOriginal, yActual = xOriginal, zActual = zOriginal
    intercambiador_dos_xor(x,z);
    // ahora xActual = zOriginal, yActual = xOriginal, zActual = yOriginal
}

int main() {
    int a = 2, b = 3, c = 4;
    // testing intercambiar dos.
    printf("ACTUALES: a: %d, b: %d\n", a, b);
    intercambiador_dos_xor(&a, &b);
    printf("INTERCAMBIADOS: a: %d, b: %d\n", a, b);
    // testing intercambiar tres.
    a = 2, b = 3;
    printf("ACTUALES: a: %d, b: %d, c: %d\n", a, b,c);
    intercambiador_tres_xor(&a, &b, &c);
    printf("INTERCAMBIADOS: a: %d, b: %d, c: %d\n", a, b,c);
    return 0;
}