class Scrap {
  int y, size;
  char type;
  boolean boom;
  PImage scrap;

  Scrap(int x, int y) {
    this.x = x;
    this.y = y;
    size = 30;
    isHit = false;
    h1 = loadImage("helthA.png");
    h2 = loadImage("helthB.png");
    h3 = loadImage("helthC.png");
    if (random(3)>2) {
      type = 'a';
      image(h1,x,y);
    } else if (random(2)>1) {
      type = 'b';
      image(h2,x,y);
    } else {
      type = 'c';
      image(h3,x,y);
    }
  }


  boolean isOffScreen() {
    if (y>3*height/2) {
      return true;
    } else {
      return false;
    }
  }
}
