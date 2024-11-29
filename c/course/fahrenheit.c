#include <stdio.h>

#define LOWER 0
#define UPPER 180
#define STEP 10
#define COLUMN_WIDTH 20


float fahr_to_cels(float fahr)
{
  return (5.0f / 9.0f) * (fahr - 32);
}


int main()
{
  float fahr;
  float cels;

  int column_width = COLUMN_WIDTH;

  printf("%-*s | %-*s\n", COLUMN_WIDTH, "Fahrenheit", COLUMN_WIDTH, "Celsius");
  for (fahr = LOWER; fahr <= UPPER; fahr += STEP) {
    cels = fahr_to_cels(fahr);
    printf("%-*0.2f | %-*0.2f\n", COLUMN_WIDTH, fahr, COLUMN_WIDTH, cels);
  }

  return 0;
}
