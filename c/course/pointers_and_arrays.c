#include <stdio.h>

/* strlen: return length of a string s */
int strlength(char *s) {

  int n;

  for (n = 0; *s != '\0'; s++)
    n++;

  return n;
}

int main() {

  int a[10];           /* an array of 10 elements */
  int *pa;             /* pointer to an integer */
  
  pa = &a[0];          /* pa points to a[0] */

  int x = *pa;         /* copies the content of a[0] into x */

  char array[100] = "Array";
  char *ptr = "Pointer";

  strlength("hello, word");
  strlength(array);
  strlength(ptr);
  
  
  return  0;
}
