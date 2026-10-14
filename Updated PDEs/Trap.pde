class Trap {
  int wide, x, y, size, speedy;
  boolean hit;
  PImage trap;

  Trap (int x, int y) {
    this.x = x;
    this.y = y;
    wide = 50;
    hit = false;
    trap = loadImage("trap.png");
    speedy = 30;
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
