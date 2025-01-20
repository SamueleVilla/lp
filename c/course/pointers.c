#include <stdio.h>
#include <ctype.h>

#define BUFSIZE 100

char buf[BUFSIZE]; /* buffer for ungetch */
int bufp = 0;      /* next free position in buf */

void swap(int*, int*);

int getch(void);
void ungetch(int);

int getint(int*);
int getfloat(float*);

int main() {

  int x = 1, y = 2, z[10];
  int *ip;                      /* ip is a pointer to in */

  ip  = &x;			/* ip is now pointing to x */
  y   = *ip;			/* y is now 1 */
  *ip = 0;			/* x is now 0 */
  ip  = &z[0];			/* ip now points to z[0] */

  *ip += 10;                    /* increment *ip by 10 */

  (*ip)++;                       /* increment *ip */

  int *iq = ip;                  /* copies the content of ip into iq*/

  int a = 10, b = 20;
  printf("Before swap: %d, %d\n", a, b);
  
  /* swap(a, b)  WRONG */
  swap(&a, &b);

  printf("After swap: %d, %d,\n", a, b);

  /* get next 10 floats form input */
  int n;
  float array[10];

  for (n = 0; n < 10 && getfloat(&array[n]) != EOF; n++)
    ;

  for(int i = 0; i < 10; ++i)
    printf("%0.5f ", array[i]);
}

void swap(int *px, int *py) { /* interchange *px and *py */

  int temp;

  temp = *px;
  *px = *py;
  *py = temp;
}


/* get a (possibly pushed back) character */
int getch(void) {

  return (bufp > 0) ? buf[--bufp] : getchar();
}

/* push character back on input */
void ungetch(int c) {

  if (bufp >= BUFSIZE)
    printf("ungetch: too many characters\n");
  else
    buf[bufp++] = c;
}

/* getint: get next integer from input into *pn */
int getint(int *pn) {

  int c, sign;

  while(isspace(c = getch())) /* skip white space */
    ;

  if (!isdigit(c) && c != EOF && c != '+' && c != '-') {
    ungetch(c); /* it's not a number */
    return 0;
  }

  /* set the right sign */
  sign = (c == '-') ? -1 : 1;
  if (c == '+' || c == '-')
    c = getch();

  if (!isdigit(c))
    ungetch(c);
  
  for (*pn = 0; isdigit(c); c = getch())
    *pn = 10 * *pn + (c - '0');

  *pn *= sign;
  if (c != EOF)
    ungetch(c);

  return c;
}

/* getfloat: get next integer from input into *pn */
int getfloat(float *pn) {

  int c, sign;

  while(isspace(c = getch())) /* skip white space */
    ;

  if (!isdigit(c) && c != EOF && c != '+' && c != '-') {
    ungetch(c); /* it's not a number */
    return 0;
  }

  /* set the right sign */
  sign = (c == '-') ? -1 : 1;
  if (c == '+' || c == '-')
    c = getch();

  if (!isdigit(c))
    ungetch(c);
  
  for (*pn = 0; isdigit(c); c = getch())
    *pn = 10 * *pn + (c - '0');

  int power = 1;
  if (c == '.') {
    c = getch();
    for (; isdigit(c); c = getch()) {
      *pn = 10 * *pn + (c - '0');
       power *= 10;
    }
  }

  *pn = (*pn / power) * (float)sign;
  if (c != EOF)
    ungetch(c);

  return c;
}
