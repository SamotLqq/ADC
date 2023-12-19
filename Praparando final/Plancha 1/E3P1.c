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

void printbin(int n) {
    int ultimoBit = 32;
    for (int i = ultimoBit; i > 0; i--) {
        if (is_one(n, i)) printf("1");
        else printf("0");
    }
    printf("\n");
    return;
}

int main() {
    printbin(8);
    printbin(32);
    printbin(45);
    printbin(0);
    printbin(126);
    printbin(1024);
    return 0;
}