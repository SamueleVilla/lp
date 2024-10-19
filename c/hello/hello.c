/* hello.c -- Programma C che dice "ciao" */

#include <stdio.h>

#define MAX_COUNT 10

int foo();

int main() {

  // foo(); // linker error
  
  for (int i = 0; i < MAX_COUNT; ++i) {
    for (int k = 0; k < i; ++k)
      printf("\t");
    
    printf("Hello world!\n");
  }
  
  return 0;
}


/* hello.c ends here */
