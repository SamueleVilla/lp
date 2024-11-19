#ifndef IO_H
#define IO_H

#include <stdio.h>

/* getline: read next line into buf, return length */
char getline(char* buf, size_t size);


#endif /* IO_H */

#ifdef IO_H_IMPLEMENTATION

char getline(char* buf, size_t size)
{
  int c, i;

  for (i = 0; i < size - 1 && (c = getchar()) != EOF && c != '\n'; i++)
    buf[i] = c;

  if (c == '\n')
    buf[i++] = c;

  buf[i] = '\0';
  return i;
}

#endif /* IO_H_IMPLEMENTATION */
