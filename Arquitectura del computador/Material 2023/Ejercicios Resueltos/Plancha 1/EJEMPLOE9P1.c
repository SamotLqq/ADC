#include <stdio.h>
#include<math.h>
#include<ieee754.h>
#include "E9P1.c"

int main () {
    float f[7] = {3.14,125,13,-21,NAN,INFINITY, 16};
    for (int i = 0; i < 7; i++) {
        printf("f: %f - ", f[i]);
        printf("exponente: %x - ", extraer_exponente(f[i]));
        printf("fraccion: %x - ", extraer_mantisa(f[i]));
        printf("comparacion exponente con 0xff: %d - ", extraer_exponente(f[i]) == 0xff); // exponente de los inf y los nan.
        printf("comparacion fraccion con 0x0: %d\n", extraer_mantisa(f[i]) == 0x0); // mantisa de los inf y potencias de 2.

    }
    return 0;
}