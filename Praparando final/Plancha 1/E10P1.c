#include <stdio.h>
#include <math.h>
int main(void) {
    float g = 0.0;
    float f = 0.0 / g;
    printf("f: %f\n", f);
    // ADVERTENCIA: ‘NAN’ es una extensi ́on de GCC.
    if (f == NAN) {
        printf("Es NAN\n");
    }
    if (isnan(f)) {
        printf("isNaN dice que si\n");
    }
    return 0;
}