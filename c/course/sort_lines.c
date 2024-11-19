#include <stdio.h>
#include <string.h>

#define IO_H_IMPLEMENTATION
#include "include/io.h"

#define RDALLOC_H_IMPLEMENTATION
#include "include/rdalloc.h"

#define MAXLINES 5000      /* max #lines to be sorted */
#define MAXLEN 1000        /* max length of any input line */

char *lineptr[MAXLINES]; /* pointers to text lines */

int readlines(char *lineptr[], size_t nlines);
void writelines(char *lineptr[], size_t nlines);

void qsort(char *lineptr[], int left, int right);

/* sort input lines */
int main()
{
  int nlines; /* number of input lines read */
  
  if ((nlines = readlines(lineptr, MAXLINES)) >= 0) {
    qsort(lineptr, 0, nlines - 1);
    writelines(lineptr, nlines);
    return 0;
  }
  
  printf("error: input too big to sort\n");
  return 1;
}

/* readlines: read input lines */
int readlines(char *lineptr[], size_t maxlines)
{
  int len, nlines;
  char *p, line[MAXLEN];
  nlines = 0;
  while((len = getline(line, MAXLEN)) > 0) {
    if (nlines >= maxlines || (p = alloc(len)) == NULL)
      return -1;
    line[len - 1] = '\0'; /* delete newline */
    strcpy(p, line);
    lineptr[nlines++] = p;
  }
  return nlines;
}

/* writelines: write output lines */
void writelines(char *lineprt[], size_t nlines)
{
  for (int i = 0; i < nlines; i++)
    printf("%s\n", lineptr[i]);
}

/* swap: interchange v[i] and v[j] */
void swap(char *v[], int i, int j)
{
  char *tmp;
  
  tmp = v[i];
  v[i] = v[j];
  v[j] = tmp;
}

/*qsort: sort v[left]...v[right] into increasing order */
void qsort(char *v[], int left, int right)
{
  int i, last;
  
  if (left >= right) /* do nothing if array contains */
    return;          /* fewer than two elements */
  
  swap(v, left, (left + right) / 2);
  last = left;
  
  for (i = left + 1; i <= right; i++)
    if (strcmp(v[i], v[left]) < 0)
      swap(v, ++last, i);
  
  swap(v, left, last);
  qsort(v, left, last - 1);
  qsort(v, last + 1, right);
}
