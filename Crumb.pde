class Crumb {
  boolean goodHit, badHit, broken;
  int x, y, crumbHealth, boltspeed, regen, regenTime;
  PImage butterimage;
    Crumb(int x, int y) {
    crumbHealth = 3000;
    regen = 1;
  }
  boolean badHit(Trap t) { //not supposed to be right here
    float d = dist(x, y, t.x, t.y);
    if (d<50) {
      crumbHealth-=300;
      regenTime = new Timer(int(random(5000)));
    }
  }
  boolean goodHit(Scrap h) { //not supposed to be right here
    float healingish = dist(x, y, h.x, h.y);
    if (healingish<50) {
      if (h.type==a) {
        crumbHealth+=600;
      } else if (h.type==b) {
        regenTime.start;
        regen = -1;
        if (regenTime.isfinished() == true) {
         regen = 1; 
        }
      } else if (h.type==c) {
        crumbHealth+=6000;
      }
    }
  }
void display() {
}
void mousePressed() {
  crumbHealth-=100;
}
void keyPressed() {
  if (key =='a' || key =='A') {
    x-=20;
  } else if (key == 'd' || key== 'D') {
    x+=20;
  }
}
    void timesRunningOutCrumb() {
      crumbHealth-=regen;
    }
}
