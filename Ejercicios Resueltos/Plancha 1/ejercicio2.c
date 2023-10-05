#include <stdio.h>
#include <stdlib.h>

int is_one(long n, int b) {
  long mask = 1;
  return ((mask<<b) & n);
}
