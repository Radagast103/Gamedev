class Bolt {
  int x, y, speed, w, h;
  PImage nut;

  Bolt(int x, int y) {
    speed=40;
    this.x=x;
    this.y=y;
    w=10;
    h=20;
    nut = loadImage("bolt.png");
  }
  void move() {
    this.y-=speed;
    image(nut,x,y);
  }
  boolean isOffScreen() {
    if (y < height + h/2) {
      return true;
    } else {
      return false;
    }
  }
}
