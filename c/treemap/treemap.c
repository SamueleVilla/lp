/**
 * treemap.c
 * - Implemetantion file for the 'treemap' Binary Search Tree library
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include "treemap.h"

struct _node {
  int key;
  void* value;
  struct _node* left;
  struct _node* right;
  struct _node* parent;
};
typedef struct _node*	Node;

struct _treemap
{
  char name[16];
  Node	root;
};

/* Node functions. */
// static function: the functions are visible only within the file where
// declared
static Node node_search(Node node, int key) {
  if (node == NULL || node->key == key)
    return node;
  else if (node->key < key)
    return node_search(node->right, key);
  else
     return node_search(node->left, key);
}

static Node node_new(int key, void* value, Node left, Node right) {
  Node	new_node = (Node) malloc(sizeof(struct _node));
  if (new_node == NULL) {
    fprintf(stderr,
	    "Treemap warning: new_node:  cannot allocate memory. \n");
    return NULL;
  }

  new_node->key    = key;
  new_node->value  = value;
  new_node->left   = left;
  new_node->right  = right;
  return new_node;
}

static Node node_insert(Node node, int key, void* value) { 
  if (node == NULL)
    return node_new(key, value, NULL, NULL);
  else if (node->key == key)
    return  node_new(key, value, node->left, node->right);
  else if (node->key > key)
    return node_new(node->key,
		    node->value,
		    node_insert(node->left, key, value),
		    node->right
		    );
  else
    return node_new(node->key,
		    node->value,
		    node->left,
		    node_insert(node->right, key, value)
		   );
}

static Node node_min(Node node) {
  Node curr = node;
  while (curr && curr->left != NULL)
    {
      curr = curr->left;
    }

  return curr;
}

static Node node_successor(Node node) {
  return node_min(node->right);
}

static Node node_remove(Node root, int key) {
  if (root == NULL) return NULL; // base case: if the tree is empty
  else if (key < root->key)
    root->left = node_remove(root->left, key);  // if key is less than
  // current node key search in the left tree
  else if (key > root->key)
    root->right = node_remove(root->right, key); // otherwise search
  // in right tree
  else {  // else the node to delete is the root {
      if (root->left == NULL) {
	  Node temp = root->right;
	  free(root);
	  return temp;
	}
      else if (root->right == NULL) {
	  Node temp = root->left;
	  free(root);
	  return temp;
	}
      
      // root with two children
      Node min_node = node_successor(root);
      root->key = min_node->key;
      root->value = min_node->value;
      root->right = node_remove(root->right, min_node->key);
    }

  return root;
}

static void node_print(Node node, int level)
{
  if (node == NULL) return;
  
  node_print(node->right, level + 1);

  for (int i = 0; i < level; ++i)
    printf("\t");
  
  printf("(%d)\n", node->key);
  
  node_print(node->left, level + 1);
}

static bool node_is_bst(Node node) {
  if (node == NULL) return true;

  if (node->right != NULL) {
    if (node->right->key > node->key)
      return node_is_bst(node->right);
    else
      return false;
  }
  
  if (node->left != NULL) {
    if (node->left->key < node->key)
      return node_is_bst(node->left);
    else
      return false;
  }

  return true;
}

/* Treemap functions. */
Treemap treemap_new(const char *name) {
  Treemap new_tm  = (Treemap) malloc(sizeof(struct _treemap));
  if (new_tm == NULL) {
    fprintf(stderr, "Treemap warning: cannot allocate memory. \n");
    return new_tm;
  }
  
  strcpy(new_tm->name, name);	// copy the given string name */
  new_tm->root = NULL;		// set the root as NULL ptr */
  return new_tm;
}

Treemap treemap_insert(Treemap tm, int key, void* value) {
  Node	new_root = node_insert(tm->root, key, value);
  tm->root = new_root;
  return tm;
}

Treemap treemap_remove(Treemap tm, int key) {
  Node new_root = node_remove(tm->root, key);
  tm->root = new_root;
  return tm;
}

void* treemap_get(Treemap tm, int key) {
  Node root = tm->root;
  if (root == NULL)
    return root;

  Node n = node_search(root, key);
  if (n == NULL)
    return n;

  return n->value;
}

void treemap_print(Treemap tm) {
  printf("Treemap: treemap '%s'\n", tm->name);
  node_print(tm->root, 0);
}

bool treemap_is_bst(Treemap tm) {
  return node_is_bst(tm->root);
}

void treemap_load_file(Treemap tm, const char* filename) {
  FILE* f;
  f = fopen(filename, "r");
  if (f == NULL) {
    fprintf(stderr, "Treemap Warning: cannot open file: %s\n", filename);
    return;
  }

  int key;
  char buffer[256];

  while (fscanf(f, "%d\t%255[^\n]", &key, buffer) != EOF) {
    treemap_insert(tm, key, buffer);
  }

  fclose(f);
}

/** treemap.h ends here. */
