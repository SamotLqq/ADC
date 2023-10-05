#include <stdio.h>
/*
Implemente una funci´on printbin:
void printbin(unsigned long n);
que tome un entero de 32 bits y lo imprima en binario
*/

void printbin(unsigned long n) {
    if (n / 2 > 0) {
        printbin(n / 2);
    }
    printf("%ld", n % 2);
}

int main() {
    printbin(100); puts("");// deberia imprimir 1100100 pues 2^6 + 2^5 +2^2 = 64 + 32 + 4 = 100
    printbin(50); puts(""); // deberia imprimir 110010 pues 2^5 + 2^4 + 2^1 = 32 + 16 + 2 = 50
    printbin(25); puts(""); // deberia imprimir 11001 pues 2^4 + 2^3 + 2^0 = 16 + 8 + 1 = 25
    printbin(12); puts("");// deberia imprimir 1100 pues 2^3 + 2^2 = 8 + 4 = 12
    printbin(108043); puts(""); // deberia imprimir pues 11010011000001011 = 1 + 2 + 8 + 512 + 1024 + 8192 + 32768 + 65536 = 108043

    return 0;
}

