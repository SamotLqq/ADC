/*
7) Muchas arquitecturas de CPU restringen los enteros a un m´aximo de 64 bits. ¿Qu´e sucede
si ese rango no nos alcanza? Una soluci´on es extender el rango utilizando m´as de un entero (en
este caso enteros de 16 bits) para representar un valor. As´ı podemos pensar que:
typedef struct {
unsigned short n[16];
} nro;
representa el valor:
N = nro.n[0] +
nro.n[1] ∗ 2
sizeof(short)∗8 +
nro.n[2] ∗ 2
2∗sizeof(short)∗8 +
... +
nro.n[15] ∗ 2
15∗sizeof(short)∗8
Podemos pensar en la estructura nro como un entero de 256 bits. Lamentablemente la
arquitectura no soporta operaciones entre valores de este tipo, por lo cual debemos realizarlas
en software.
a) Implemente funciones que comparen con 0 y con 1 y determinen paridad para valores
de este tipo.
b) Realice funciones que corran a izquierda y derecha los valores del tipo nro.
c) Implemente la suma de valores del tipo nro.
Nota: en el repositorio Subversion de la materia hay una funci´on para imprimir valores de
este tipo. Esta funci´on utiliza la biblioteca GMP (GNU Multiple Precision Arithmetic Library),
por lo cual deber´a compilar el c´odigo agregando la opci´on -lgmp. Puede encontrar la funci´on en
el archivo c´odigo/enteros grandes/gmp1.c:
https://svn.dcc.fceia.unr.edu.ar/svn/lcc/R-222/Public/cdigo/enteros_grandes/gmp1.
c
*/
#include <stdio.h>
#include <limits.h>

typedef struct {
    unsigned short n[16];
} nro;

void printInt256(nro numero) {
    for (int i = 0; i < 16; i++) {
        printf("%04x ", numero.n[i]);
    }
    printf("\n");
}

int es_par(nro numero) { // 1
    // N = [[0001 1111 1111 1110],[1010101011111110], ..., [1111111111111100]] 16 cajas que cada contienen 16 bits cada una. 16*16 = 256 bits. aproximadamente podemos representar hasta 50000...000 (76 0´s)
    int ultimos_16_bits = numero.n[15];
    if (ultimos_16_bits & 0x1 == 1) {
        return 0;
    }
    return 1;
}

nro correr_uno_a_derecha(nro numero) {
    unsigned short* N = numero.n;
    unsigned short mascara = 0b0000000000000001;
    for (int i = 15; i >= 0; i--) {
        if (i > 0) {
            N[i] = N[i] >> 1;
            N[i] = N[i] | ((N[i-1] & mascara)<<15);
        }
        if (i == 0) N[i] = N[i] >> 1;
    }
    return numero;
}

nro correr_uno_a_izquierda(nro numero) {
    unsigned short* N = numero.n;
    unsigned short mascara = 0b1000000000000000;
    for (int i = 0; i < 16; i++) {
        if (i < 15) {
            N[i] = N[i] << 1;
            N[i] = N[i] | ((N[i+1] & mascara)>>15);
        }
        if (i == 15) N[i] = N[i] << 1;
    }
    return numero;
}

nro correr_a_izquierda(nro numero, unsigned short cantidad) {
    for (int i = 0; i < cantidad; i++) {
        numero = correr_uno_a_izquierda(numero);
    }
    return numero;
}
nro correr_a_derecha(nro numero, unsigned short cantidad) {
    for (int i = 0; i < cantidad; i++) {
        numero = correr_uno_a_derecha(numero);
    }
    return numero;
}

nro sumar_nro(nro N1, nro N2) { // [1101] [1001] -> 1[0110]
    nro resultado;
    int acarreo = 0;
    for (int i = 15; i >= 0; i--) {
        resultado.n[i] = N1.n[i] + N2.n[i] + acarreo;
        if (N1.n[i] + acarreo > USHRT_MAX - N2.n[i]) acarreo = 1;
        else acarreo = 0;
    }
    return resultado;
}
// para que funcione (ademas de cambiar los corrimientos, suma y restas a las funciones definidad) deberiamos
// definir la resta o generalizarlo para enteros asi podemos hacer -1.
// nro multiplicar_nro(nro N1, nro N2) {
//     int cero = 0;
//     int uno = 0;
//     for (int i = 0; i < 16; i++) {
//         if (i == 15 & N2.n[i] == 1) {
//             uno = 1;
//             break;
//         }
//         if (N2.n[i] != 0) {
//             cero = 1;
//             break;
//         }
//     }
//     if (cero) {
//         nro cero;
//         for (int i = 0; i < 15; i++) {
//             cero.n[i] = 0;
//         }
//         return cero;
//     }
//     else if (uno) {
//         nro uno;
//         for (int i = 0; i < 15; i++) {
//             uno.n[i] = 0;
//         }
//         return uno;
//     }
//     else if (N2.n[15] & 0x1 == 1) {
//         return multiplicar_nro(N1, N2 - 1) + N1;
//     }
//     else {
//         return multiplicar_nro(N1 << 1, N2 >> 1);
//     }
// }


int main() {
    // prueba desplazamientos y paridad.
    // // inicializamos N.
    // nro N;
    // for (int i = 0; i < 16; i++){
    //     N.n[i] = 8;
    // }
    // // imprimimos los valores actuales.
    // for (int i = 0; i < 16; i++)
    // {
    //     printf("casilla: %d, valor: %d\n", i, N.n[i]);
    // }
    // // modificamos e imprimimos los valores modificados.
    // N = correr_a_izquierda(N, 2); // probamos si funca
    // for (int i = 0; i < 16; i++)
    // {
    //     printf("casilla: %d, valor: %d\n", i, N.n[i]);
    // }
    // printf("es par?: %d\n", es_par(N));

    // // prueba funcion suma
    // nro N1, N2;
    // for (int i = 0; i < 16; i++){
    //     N1.n[i] = 32768;
    //     N2.n[i] = 32753 + i;
    // }
    // N1.n[15] = 32768;
    // N2.n[15] = 32768;
    // nro SUMA = sumar_nro(N1, N2);
    // printInt256(N1);
    // printInt256(N2);
    // printInt256(SUMA);
    // return 0;
}