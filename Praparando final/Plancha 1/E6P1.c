#include<stdio.h>

unsigned campesino_ruso(unsigned a, unsigned b) {
    if (b == 0) return 0;
    else if (b == 1) return a;
    else if (b & 1) {
        return a + campesino_ruso(a << 1, b >> 1);
    }
    else { // (b%2 = 0)
        return campesino_ruso(a << 1, b >> 1);
    }
}

int main() {
    unsigned res = campesino_ruso(523,1102);
    printf("EL resultado es: %u\n", res);
    return 0;
}