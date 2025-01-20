
/**
 * treemap.h
 * - Header file for the 'treemap' Binary Search Tree library
 */

#ifndef _TREEMAP_H
#define _TREEMAP_H

#include <stdbool.h>

typedef struct _treemap* Treemap;

extern Treemap treemap_new(const char* name);

extern Treemap treemap_insert(Treemap, int key, void* value);

extern Treemap treemap_remove(Treemap, int key);

extern void* treemap_get(Treemap, int key);

extern void treemap_print(Treemap);

extern bool treemap_is_bst(Treemap);

extern void treemap_load_file(Treemap, const char* filename);

#endif /*  _TREEMAP_H */

/** treemap.h ends here. */
