class Trap {
  int wide;
  boolean hit;
  PImage trap;

  Trap (int x, int y, int speedy) {
    this.x = x;
    this.y = y;
    wide = 50;
    hit = false;
    trap = loadImage("trap.png");
  }
  boolean isOffScreen() {
    if (y > height + size/2) {
      return true;
    } else {
      return false;
    }
  }
  void move() {
    y+=speedy;
  }
}
