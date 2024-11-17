#include <stdio.h>

/* strlen: length of the string s */
int strlen(char *s)
{
  char *p = s;

  while(*p != '\0')
    p++;
  
  return p - s;
}


/* strcpy: copy t to s; poiner version 2 */
void strcpy(char *s, char *t)
{
  while (*s++ = *t++)
    ;
}

/* strcmp: return < 0 if s < t, 0 if s == t, > 0 if s > t */
int strcmp(char *s, char *t)
{
  for (; *s == *t; s++, t++)
    if (*s == '\0')
      return 0;

  return *s - *t;
}

/* strcat: copies the string t to the end of s */
void strcat(char *s, char *t)
{
  for (; *s != '\0'; s++)
    ;
  for (; (*s = *t) != '\0'; s++, t++)
    ;
}

/* strend: returns 1 if the string t occurs at the end of s */
int strend(char *s, char *t)
{
  int len_s = strlen(s);
  int len_t = strlen(t);
  
  if (len_s < len_t)
    return 0;

  int d = len_s - len_t;
  for (int i = 0; i < len_t; ++i)
    if (*(t + i) != *(s + i + d))
      return 0;

  return 1;
}


int main()
{

  char s[20];

  printf("-- strcpy -- \n");
  strcpy(s, "Hello, world");
  printf("copied: %s\n", s);
  
  printf("-- strcmp -- \n");
  printf("abc > cbd ? %d\n", strcmp("abc", "cbd"));
  printf("zdx > fdx ? %d\n", strcmp("zdx", "fdx"));
  printf("abc = abc ? %d\n", strcmp("abc", "abc"));

  printf("-- strcat -- \n");
  char s1[50] = "Hello";
  char t1[50] = " World";
  strcat(s1, t1);
  printf("concat: %s\n", s1);

  printf("-- strlen -- \n");
  printf("length of 'ciao': %d\n", strlen("ciao"));

  printf("-- strend -- \n");
  printf("Ciao ends with ao ? %d \n", strend("Ciao", "ao"));
  printf("Ciao ends with iao ? %d \n", strend("Ciao", "iao"));
  printf("Ciao ends with Ciao ? %d \n", strend("Ciao", "Ciao"));
  printf("Ciao ends with xyyyyzz ? %d \n", strend("Ciao", "xyyyyzz"));
  printf("Ciao ends with xyz ? %d \n", strend("Ciao", "xyz"));
  
  return 0;
}
