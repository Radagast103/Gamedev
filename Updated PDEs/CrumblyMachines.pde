// Paul Rets | Sep 23, 2026 | GameDev1, 3A
// Some credit goes to Torbjorn, Harvey, for use of his project as reference. I got terribly behind, so this was the such a useful reference. Thank You Harvey Torbjorn.
import sound.*;
Crumb crumb1;
Timer trapTime, helthTime, speedyTime;
ArrayList<Trap> traps = new ArrayList<Trap>();
ArrayList<Scrap> helths = new ArrayList<Scrap>();
ArrayList<Bolt> bolts = new ArrayList<Bolt>();
int score, speedy, trapCount, helthCount;
PImage ded, background;
boolean goodHit, badHit;

void setup() {
  size(500, 1000);
  frameRate = 30;
  //trap.add(new Trap(int(random width)),
  trapTime = new Timer(int(random(500, 1500)));
  trapTime.start();
  speedyTime = new Timer(1000);
  speedyTime.start();
  helthTime = new Timer(int(random(5000, 7000)));
  helthTime.start();
  trapCount = 0;
  helthCount = 0;
  ded = loadImage("gameOver.png");
  background = loadImage("background.png");
  speedy =20;
}

void draw() {
  imageMode(CENTER);
  image(background, width/2, height/2);
  if (helthTime.isFinished() == true) {
    helths.add(new Scrap(int(random(width)), -80));
    helthTime.start();
  }
  if (trapTime.isFinished() == true) {
    traps.add(new Trap(int(random(width)), -80));
    trapTime.start();
  }
  if (speedyTime.isFinished() == true) {
    speedy+=1;
    speedyTime.start();
  }
  for (int i = 0; i < traps.size(); i++) {
    println("traps: " + traps.size());
    Trap t = traps.get(i);
    t.move();
    if (badHit == true) {
      traps.remove(t);
    }
    if (t.isOffScreen() == true) {
      traps.remove(t);
    }
  }

  //bolts
  for (int i = 0; i < bolts.size(); i++) {
    println("Bolts: " + bolts.size());
    Bolt b = bolts.get(i);
    for (int j = 0; j < traps.size(); j++) {
      Trap t = traps.get(j);
      if (t.isHit(b)) {
        // remove enemy & laser
        traps.remove(t);
        bolts.remove(b);
      }
    }

    if (b.isOffScreen() == true) {
      bolts.remove(b);
    }
  }
  //powerups
  for (int i = 0; i < helths.size(); i++) {
    println("Health: " + helths.size());
    helths = Scrap.get(i);

    //add isHit()
    if (i.isHit(crumb1)) {
      //inrease hp of player
      helths.remove(i);
      crumb1.crumbHealth += 50;
    }
    if (i.isOffScreen() == true) {
      helths.remove(i);
    }
  }
  infoPanel();
}
void noises(Crumb badHit, Crumb goodHit) {
  if (goodHit == true) {
    healing.play;
  }
  if (badHit == true) {
    ouch.play;
  }
}
void mousePressed() {
  bolts.add(new Bolt(Crumb1.x, Crumb1.y, laserSpeed));
  if (!bolt.isPlaying()) {
    bolt.play();
  }
}
void infoPanel() {
  fill(127, 127);
  rectMode(CORNER);
  rect(0, 0, width, 40);
  fill(255);
  textAlign(CORNER, CORNER);
  text("Score:"+(speedy-20), 20, 35);
}

void gameOver(Crumb crumb1) {
  if (crumbHealth<0) {
    noStroke();
    imageMode(CENTER);
    image(ded, width/2, height/2);
    fill (255, 255, 255);
    textSize(100);
    text(score, width/2, 750);
    noLoop();
  }
}
