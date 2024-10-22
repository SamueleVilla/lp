#include <stdio.h>
#include "treemap.h"

int main() {

  // Create a simple tree for demonstration
  printf("Creating treemap...\n");
  
  Treemap tm = treemap_new("Tech companies");

  printf("Inserting data in the treemap...\n");
  tm = treemap_insert(tm, 10, "Apple");
  tm = treemap_insert(tm, 12, "Microsoft");
  tm = treemap_insert(tm, 5, "Google");
  tm = treemap_insert(tm, 1, "Olivetti");
  tm = treemap_insert(tm, 8, "Netflix");
  
  printf("Printing treemap...\n\n");
  treemap_print(tm);

  printf("\n------------------------------\n");
  printf("[1] => %s", (char*) treemap_get(tm, 1));
  printf("\n");
  printf("[5] => %s", (char *) treemap_get(tm, 5));
  printf("\n------------------------------\n");
  
  printf("Removing Apple bc is shit company :)\n");
  tm = treemap_remove(tm, 10);
  treemap_print(tm);

  printf("\n------------------------------\n");
  printf("Treemap is bst?: %d", treemap_is_bst(tm));
  printf("\n------------------------------\n");
  printf("Treemap I/O -- Load from file \n");

  Treemap tm1 = treemap_new("Films");

  treemap_load_file(tm1, "input.txt");

  treemap_print(tm1);
    
  return 0;
}
