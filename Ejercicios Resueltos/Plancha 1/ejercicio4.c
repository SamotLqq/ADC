#include <stdio.h>
#include <stdlib.h>

void rotar_dos(int* x, int* y) {
  *x = *x ^ *y;
  *y = *y ^ *x ;
  *x = *x ^ *y;
}

void rotar_tres(int* x, int* y , int* z){
  rotar_dos(x,y);
  rotar_dos(x,z);
}

int main() {
  int a = 5;
  int b = 6;
  int c = 7;
  
  printf("%d\n", a);
  printf("%d\n", b);
  printf("%d\n", c);
  
  rotar_tres(&a,&b,&c);
  
  printf("%d\n", a);
  printf("%d\n", b);
  printf("%d\n", c);
  
  return 0;
}
