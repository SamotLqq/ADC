/*
9) Haga dos funciones o macros de C para extraer la fraccion y el exponente de un float sin
usar variables auxiliares.
Sugerencia: utilice corrimientos de bits y mascaras. Luego use los tipos definidos en la cabe-
cera ieee754.h para corroborar.
*/

#include <stdio.h>
#include<math.h>
#include<ieee754.h>

int extraer_exponente(float f) {
    int MASCARA = 0b01111111100000000000000000000000;
    int CORRIMIENTO = 23;
    int fint = *((int*) &f);
    return (fint & MASCARA) >> CORRIMIENTO;
}

int extraer_mantisa(float f) {
    int MASCARA = 0b00000000011111111111111111111111;
    int fint = *((int*) &f);
    return fint & MASCARA;
}

