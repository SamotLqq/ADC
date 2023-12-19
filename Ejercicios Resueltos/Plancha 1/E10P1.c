// 10) El siguiente programa muestra algunas cualidades de NaN (Not A Number) y la funci ́on
// isnan de C, que indica si un flotante es NaN.
// d) El programa muestra que comparar con NAN retorna siempre falso y para saber si
// una operaci ́on dio NaN se puede usar isnan. Utilizando las funciones del ejercicio anterior,
// implemente una funci ́on myisnan que haga lo mismo que la funci ́on isnan de C.
// e) Implemente otra funci ́on, myisnan2, que haga lo mismo pero utilizando solo una com-
// paraci ́on y sin operaciones de bits.
// f) ¿Ocurre lo mismo con +∞?
// g) ¿Qu ́e pasa si se suma un valor a +∞?
#include <stdio.h>
#include <math.h>
#include "E9P1.c"

// d)
int myisnan(float f) {
    return (extraer_exponente(f) == 0xff && extraer_mantisa(f) != 0x00);
}

// e)
int myisnan2(float f) { // como f!=f da 0 para todo numero representable y 1 para NAN podemos usar esta comparaciòn.
    return f != f;
}

// f)
// No, pues al comparar inf con inf, C retorna true. y esto es porque hay  
// muchas configuraciones de bits distintas de NAN mientras que de +inf una sola.

// g)
// si sumamos un valor finito a +inf nos devuelve +inf. si sumamos -inf a +inf nos da NAN. si sumamos NAN a +inf da NAN.


int main(void) {
    float g = 0.0;
    float f = 0.0 / g;
    printf("f: %f\n", f);
    // ADVERTENCIA: ‘NAN’ es una extension de GCC.
    if (f == NAN) {
        printf("Es NAN\n");
    }
    if (myisnan(f)) {
        printf("myisNaN dice que si\n");
    }
    if (myisnan2(f)) {
        printf("myisNaN2 dice que si\n");
    }

    if (NAN == NAN) {
        // no se ejecuta la instrucciòn, por lo tanto NAN != NAN.
        printf("NAN igual a NAN\n");
    }
    if (INFINITY == INFINITY) {
        // Como la instruccion se ejecuta
        // la condiciòn es vàlida 
        // y podemos decir que no ocurre lo mismo que con NAN.
        // (que al compararlo consigo mismo retorna 0)
        printf("infinity es igual a infinity\n");
    }

    // Ejecutando estas instrucciones en gdb podemos ver que ocurre al sumarle cosas a inf.
    float a = INFINITY;
    a = INFINITY + 1;
    a = a + NAN;
    a = INFINITY;
    a = a - INFINITY;
    return 0;
}