#include <stdio.h>
#include <ctype.h>
#include <string.h>

#define MAXWORD 100
#define NKEYS (sizeof(keytab) / sizeof(struct key))

struct key {
  char* word;
  int count;
} keytab[] = {
  "auto", 0,
  "break", 0,
  "case", 0,
  "char", 0,
  "const", 0,
  "continue", 0,
  "default", 0,
  "do", 0,
  "double", 0,
  "else", 0,
  "enum", 0,
  "extern", 0,
  "float", 0,
  "for", 0,
  "goto", 0,
  "if", 0,
  "inline", 0,
  "int", 0,
  "long", 0,
  "register", 0,
  "return", 0,
  "short", 0,
  "signed", 0,
  "sizeof", 0,
  "static", 0,
  "struct", 0,
  "switch", 0,
  "typedef", 0,
  "union", 0,
  "unsigned", 0,
  "void", 0,
  "volatile", 0,
  "while", 0,
};

int binsearch(char*, struct key tab[], int n);
int getword(char*, int);

/* count C keywords */
int main() {

  int n;
  char word[MAXWORD] = {};

  while (getword(word, MAXWORD) != EOF)
    if (isalpha(word[0])) 
	if ((n = binsearch(word, keytab, NKEYS)) >= 0)
	  keytab[n].count++;

  for (n = 0; n < NKEYS; n++)
    if (keytab[n].count > 0)
      printf("%4d %s\n", keytab[n].count, keytab[n].word);
}

/* binsearch: binary seatch on the array  */
int binsearch(char* word, struct key tab[], int n) {

  int cond;
  int low, high, mid;

  low = 0;
  high = n - 1;
  while (low <= high) {
    mid = (low + high) / 2;
    if (strcmp(word, tab[mid].word) < 0)
      high = mid - 1;
    else if (strcmp(word, tab[mid].word) > 0)
      low = mid + 1;
    else
      return mid;
  }

  return -1;
}

/* getword: fetches next word */
int getword(char* buffer, int max) {
    int c;
    int i = 0;

    // Skip any leading whitespace
    while (isspace(c = getchar()))
      ;
        // Just keep reading until a non-whitespace character is found
    
    // If we've reached EOF, return EOF
    if (c == EOF) {
        return EOF;
    }
    
    // Read characters until whitespace, EOF, or maximum length reached
    do {
        if (i < max - 1) {   // Leave space for the null terminator
            buffer[i++] = c; // Store the character in the buffer
        }
        c = getchar();
    } while (!isspace(c) && c != '*' && c != EOF);

    buffer[i] = '\0'; // Null-terminate the string

    return c;
}

