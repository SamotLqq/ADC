#include<stdio.h>
#include<string.h>
#include <stdlib.h>

void rotar(int* a, int* b, int* c) {
    *c = *c^*b;
    *b = *a^*b;
    *a = *a^*b^*c;
    *b = *a^*b^*c;
    *c = *a^*c;
    return; 
}


