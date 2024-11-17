#include <stdio.h>

#define ALLOCSIZE 10000          /* size of available space 10KB */

static char allocbuf[ALLOCSIZE];      /* storage for alloc */
static char *allocp = allocbuf;  /* next free position */

/* alloc: return pointer to n characters */
char* alloc(int n) {

  if (allocbuf + ALLOCSIZE - allocp >= n) { /* it fits */
    allocp += n;       /* increment the poiter */
    return allocp - n; /* old p */
  }

  return NULL; /* not enough room */
}

/* afree: free storage pointed to by p */
void afree(char *p) {
  
  if (p >= allocbuf && p < allocbuf + ALLOCSIZE)
    allocp = p;
}

int main() {

  char *p = alloc(10);
  printf("alloc: %p \n", p);
  afree(p);

  return 0;
}
