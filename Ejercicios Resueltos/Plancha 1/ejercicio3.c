#include <stdio.h>
#include <stdlib.h>

void printbin(unsigned long n) {
  int a;
  for (int i = 0; i < 32; i++) {
    a = (n >> (31-i));
    printf("%d", a&1);
  } 
  
  return;
}


int main() {
  int a = 5;
  
  printbin(a);
  
  return 0;
}
