#include<stdio.h>
#include<string.h>
#include <stdlib.h>

// cod de "codifica", deco de "decodifica" (hace ambas pes es su propia inversa)
void codeco(char* cadena, char codigo) {
    int longitud = strlen(cadena);
    for (int i = 0; i < longitud; i++)
    {
        cadena[i] = cadena[i]^codigo;
    }
}

int main(int argc, char* argv[]) {
    printf("%d\n%s\n", argc, argv[0]);
    if (argc > 2) {
        char* codigoStr = argv[1];
        int codigoInt = atoi(codigoStr);
        char codigoChar = (char)codigoInt;
        char* cadena = argv[2];
        printf("Valor real: %s\n", cadena);
        // codif
        codeco(cadena, codigoChar);
        printf("Valor codificado %s\n", cadena);
        // decodif
        codeco(cadena, codigoChar);
        printf("Valor decodificado: %s\n", cadena);
        }

    return 0;
}