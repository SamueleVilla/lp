#include <stdio.h>
#include <math.h>

#define XMAX 800
#define YMAX 600

#define min(x, y) (x <= y ? (x) : (y));
#define max(x, y) (x >= y ? (x) : (y));

struct point {
  int x;
  int y;
};

struct rect {
  struct point pt1;
  struct point pt2;
};

/* makepoint: make a point from x and y components */
struct point makepoint(int x, int y) {
  struct point tmp;

  tmp.x = x;
  tmp.y = y;
  return tmp;
}

/* addpoint: add two points */
struct point addpoint(struct point p1, struct point p2) {
  p1.x += p2.x;
  p1.y += p2.y;
  return p1;
}

/* ptinrect: return 1 if p in r, 0 if not */
int ptinrect(struct point p, struct rect r) {
  return
    p.x >= r.pt1.x &&
    p.x < r.pt2.x &&
    p.y >= r.pt1.y &&
    p.y < r.pt2.y;
}

/* canonrect: canonicalize coordinates of rectangle */
struct rect canonrect(struct rect r) {
  struct rect tmp;

  tmp.pt1.x = min(r.pt1.x, r.pt2.x);
  tmp.pt1.y = min(r.pt1.y, r.pt2.y);
  tmp.pt2.x = max(r.pt1.x, r.pt2.x);
  tmp.pt2.y = max(r.pt1.y, r.pt2.y);
  return tmp;
}

/* makerect: make a rect from point pt1 and point pt2 */
struct rect makerect(struct point pt1, struct point pt2) {
  struct rect tmp;

  tmp.pt1 = pt1;
  tem.pt2 = pt2;
  return pt2;
}

int main() {
  struct rect screen;
  struct point middle;

  screen = makerect(makepoint(0,0), makepoint(XMAX, YMAX));
  middle = makepoint((screen.pt1.x + screen.pt2.x) / 2,
		     (screen.pt1.y + screen.pt2.y) / 2);


  return 0;
}
