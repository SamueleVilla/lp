#ifndef RDALLOC_H
#define RDALLOC_H

/* alloc: return pointer to n characters */
char *alloc(size_t n);
/* afree: free storage pointed to by p */
void afree(char *p);

#endif /* RDALLOC_H */


#ifdef RDALLOC_H_IMPLEMENTATION

#define ALLOCSIZE 10000               /* size of available space 10KB */
static char allocbuf[ALLOCSIZE];      /* storage for alloc */
static char *allocp = allocbuf;       /* next free position */

char* alloc(size_t n)
{
  if (allocbuf + ALLOCSIZE - allocp >= n) { /* it fits */
    allocp += n;       /* increment the poiter */
    return allocp - n; /* old p */
  }

  return NULL; /* not enough room */
}

void afree(char *p)
{
  
  if (p >= allocbuf && p < allocbuf + ALLOCSIZE)
    allocp = p;
}

#endif /* RDALLOC_H_IMPLEMENTATION */

