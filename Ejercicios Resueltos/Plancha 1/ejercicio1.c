#include <stdio.h>
#include <stdlib.h>


int main() {
  int a = 1 << 31;
  
  int b = (1 << 15) | (1 << 31);
  
  int c = -1 & ~(0xff);
  
  int d = (0xAA << 24) | (0xAA);
  
  int e = 5 << 8;
  
  int f = -1 & (~(1 << 8));
  
  int g = 0 - 1;
  
  int h = 0x80000000 + 0x80000000;
  
  return 0;

}


