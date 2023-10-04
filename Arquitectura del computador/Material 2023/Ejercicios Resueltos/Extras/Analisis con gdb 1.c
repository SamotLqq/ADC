// Ejecutar el siguiente programa y analizar lo que imprime por pantalla. Conviene usar GDB para observar el contenido de las variables.
// Ayuda: Para signed char se usa el modificador %hhd y para unsigned char el modificador %hhu.
// Repetir usando los modificadores %d y %u en lugar de %hhd y %hhu, respectivamente.
#include <stdio.h>
int main()
{
    char a=127;
    printf("%hhd %hhu\n",a,a);
    a=++a;
    printf("%hhd %hhu\n",a,a);
    unsigned char b=128;
    printf("%hhd %hhu\n",b,b);
    b=++b;
    printf("%hhd %hhu\n",b,b);
    return 0;
}
