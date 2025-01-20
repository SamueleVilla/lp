#include <stdio.h>

#define RDALLOC_H_IMPLEMENTATION
#include "include/rdalloc.h"

int main()
{

  char *p = alloc(10);
  printf("alloc: %p \n", p);
  afree(p);

  return 0;
}
