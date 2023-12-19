#include <stdio.h>


int is_one(long b, int n) {
    if (n < 1 || n > 32) {
        printf("Posición no válida\n");
        return -1;
    }
    if (b & (1 << (n-1))) {
        return 1;
    }
    return 0;
}

int main() {
    printf("Es uno?: %d\n", is_one(0b1010, 0));
    printf("Es uno?: %d\n", is_one(0b1010, 33));
    printf("Es uno?: %d\n", is_one(0b1010, 32));
    printf("Es uno?: %d\n", is_one(0b1010, 1));
    printf("Es uno?: %d\n", is_one(0b1010, 4));
    printf("Es uno?: %d\n", is_one(0b1010, 2));
    return 0;
}