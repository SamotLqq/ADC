#include <stdio.h>

int solve(float a, float b, float c, float d, float e, float f, float *x, float *y);

int main() {
    float a = 3.14, b = 5.32, d = 32.7, e = -21.1324, c = -108, f = -1000, x, y;
    int solucionado = solve(a,b,c,d,e,f,&x,&y);
    if (solucionado == 0) {
        printf("La solucion del sistema es x = %f, y = %f\n", x, y);
    }
    else {
        printf("No existe solucion unica para el sistema");
    }
    return 0;
}

    /* 
    la solucion esperada es x = 1 e y = 0, ya que,
    [2 1] [1] = [2*1 + 1*0] = [2]
    [2 0] [0] = [2*1 + 0*0] = [2]
    */