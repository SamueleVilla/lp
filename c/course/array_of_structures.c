#include <stdio.h>
#include <ctype.h>
#include <string.h>


#define MAXWORD 100
#define NKEYS 6


struct key {
  char *word;
  int count;
};

const struct key keytab[] = {
    "auto", 0,
    "break", 0,
    "case", 0,
    "char", 0,
    "const", 0,
    "continue", 0
};

int binsearch(char *, int);
int getword(char *, struct key *, int);

/* count C keywords */
int main() {
  
  int n;
  char word[MAXWORD];

  while (getword(word, MAXWORD) != EOF) {

    if (isalpha(word[0])) {
	if ((n = binsearch(word, keytab, NKEYS)) >= 0) {
	  keytab[n].count++;
	}
    }
  }

  for (n = 0; n < NKEYS; n++)
    if (keytab[n].count > 0)
      printf("%4d %s\n", keytab[n].count, keytab[n].word);

}

