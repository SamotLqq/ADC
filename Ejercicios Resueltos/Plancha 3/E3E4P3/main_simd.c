#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include "comunes.h"

void sum_simd(float *a, float *b, int len);

int main() {
    // prueba
    float a[11] = {1, 1, 1, 1.2, 1.3, 1.4, 1.5,  1.6,  1.7,  1.8,  1.9};
    // +
    float b[11] = {2, 3, 4, 2.3, 3.7, 4.1, 5.5, -6.1, -7.7, -8.3, -9.9};
    // =         { 3  4  5  3.5,   5, 5.5,   7, -4.5,   -6, -6.5,   -8}
    int len = 11;
    sum_simd(a,b,len);
    imprimir_arreglo(a, len);
    // clock_gettime (al compilar usar la bandera -lrt)
    long elementos = 100000000;
    float *c = malloc(sizeof(float)*elementos);
    float *d = malloc(sizeof(float)*elementos);
    rellenar_arreglo(c,elementos);
    rellenar_arreglo(d,elementos);
    // funciones de time.h
    struct timespec start, end;
    double elapsed_time;
    // Registra el tiempo de inicio
    clock_gettime(CLOCK_REALTIME, &start);
    // Medimos la operacion sum
    sum_simd(c,d,elementos);
    // Registra el tiempo de finalización
    clock_gettime(CLOCK_REALTIME, &end);
    // Calcula el tiempo transcurrido en segundos
    elapsed_time = ((double)(end.tv_sec - start.tv_sec) + (double)(end.tv_nsec - start.tv_nsec)) / 1e9;
    printf("Tiempo transcurrido: %f\n", elapsed_time);
    free(c);
    free(d);


    return 0;
}
// gcc -g -Wall -Werror -Wextra -o main_simd sum_simd.s main_simd.c -no-pie -lrt
// obs: con 100.000.000 elementos sum_simd tarda 0.05s aprox (la mitad que sum).