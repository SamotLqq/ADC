#include <assert.h>
#include <stdio.h>

/*
2) Implemente una funcion:
int is_one(long n, int b);
que indique si el bit b del entero n es 1 o 0
*/

int is_one(long n, int b) {
    // obs: si contamos las posiciones desde b1 a b32 en lugar de b0 hasta b31 tendriamos que mover el uno b-1 bits a la izquierda.
    int mascara = 1 << b;
    return (n & mascara) != 0;
}

int main() {
    // testeo;                   POSICIONES:  31  30 29              ...           3 2 1 0
    int a = 0xAAAAAAAA; // ESTE ES EL NUMERO:  1   0  1  0101010101010101010101010 1 0 1 0
    // es fácil ver que el numero dado en las posiciones pares dadas tiene 0´s y en las impares 1´s.
    for (int i = 0; i < 32; i++)
    {
        if (i % 2 == 0) assert(is_one(a, i) == 0);
        else assert(is_one(a, i) == 1);
    }
    return 0;
}