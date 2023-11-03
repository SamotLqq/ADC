void imprimir_arreglo(float *a, int len) {
    printf("El arreglo es: ");
    for (int i = 0; i < len; i++)
    {
        printf("%f ", a[i]);
    }
    puts("");
}
void rellenar_arreglo(float *a, int len) {
    for (int i = 0; i < len; i++)
    {
        a[i] = i;
    }
    
}