Sprite p;
int[] h, ht, hb;
int[] v, vt, vb;
int hn, vn;
int numWallsH, numWallsV;
int dn, dotMax, dotsLeft;
int[] dx, dy;
boolean[] dotVis;
int lives, level;
boolean display;
Sprite g1, g2, g3, g4;
void setup() {
  size(400, 400);
  fill(255);
  p = new Sprite(200, 290, 1);
  //createWall(100, 200, 100, 300);
  numWallsH = 24;
  numWallsV = 21;
  hn = 0;
  vn = 0;
  h = new int[numWallsH];
  ht = new int[numWallsH];
  hb = new int[numWallsH];
  v = new int[numWallsV];
  vt = new int[numWallsV];
  vb = new int[numWallsV];
  g1 = new Sprite(200, 200, 1.1);
  g2 = new Sprite(200, 200, 1.1);
  g3 = new Sprite(200, 200, 1.1);
  g4 = new Sprite(200, 200, 1.1);
  dn = 0;
  dotMax = 169;
  dx = new int[dotMax];
  dy = new int[dotMax];
  dotVis = new boolean[dotMax];
  for (int i = 0; i < dotMax; i++) dotVis[i] = true;
  dotsLeft = dotMax;
  lives = 2;
  level = 1;
  display = true;
  doEverything();
}

void draw() {
  if (display) {
    background(0);
    //createWallV(100, 200, 300);
    //createWallH(200, 200, 300);
    killDot();
    fill(255);
    setupDots();
    fill(#0000FF);
    setupStage();
    fill(#FFEE00);
    p.show(0);
    p.move();
    fill(#EA82E5);
    if (random(100) > 75 || g1.getDir() == -1) {
      if (p.getDir() != -1)g1.setDir(p.getDir());
    }
    g1.detect();
    g1.show(1);
    g1.move();
    fill(#46BFEE);
    if (random(1000) > 950 || g2.getDir() ==-1) {
      int testDir = (int) random(4);
      if (abs(testDir - g2.getDir()) != 2)
        g2.setDir(testDir);
    }
    g2.detect();
    g2.show(2);
    g2.move();
    fill(#D03E19);
    if (true) {
      if (g3.getX() > p.getX()) g3.setDir(2);
      else if (g3.getX() < p.getX()) g3.setDir(0);
      else if (g3.getY() > p.getY()) g3.setDir(3);
      else if (g3.getY() < p.getY()) g3.setDir(1);
    }
    g3.show(3);
    g3.move();
    fill(#DB851C);
    if (true) {
      if (g4.getY() > p.getY()) g4.setDir(3);
      else if (g4.getY() < p.getY()) g4.setDir(1);
      else if (g4.getX() > p.getX()) g4.setDir(2);
      else if (g4.getX() < p.getX()) g4.setDir(0);
    }
    g4.show(4);
    g4.move();
    //caught();
    nextLevel();
    fill(255);
    text("lives: " + lives, 0, 400);
    text("dots remaining: " + dotsLeft, 250, 400);
    caught();
  }
  else {
    delay(1000);
    display = true;
  }
}
void keyPressed() {
  //ellipse(50,50,50,50);
  if (key == CODED) {
    if (keyCode == UP) p.setDir(3);
    if (keyCode == DOWN) p.setDir(1);
    if (keyCode == LEFT) p.setDir(2);
    if (keyCode == RIGHT) p.setDir(0);
  }
}
void caught() {
  if ((p.getX() == g1.getX() && p.getY() == g1.getY()) ||
    (p.getX() == g2.getX() && p.getY() == g2.getY()) ||
    (p.getX() == g3.getX() && p.getY() == g3.getY()) ||
    (p.getX() == g4.getX() && p.getY() == g4.getY())
    ) {
    if (lives == 0) {
      background(0);
      textSize(50);
      text("Game over!", 50, 200);
      display = false;
      textSize(12);
      lives = 3;
    }

    p.setXY(200, 290);
    g1.setXY(200, 200);
    g2.setXY(200, 200);
    g3.setXY(200, 200);
    g4.setXY(200, 200);
    lives--;
  }
}
void nextLevel() {
  if (dotsLeft == 0) {
    p.setXY(200, 290);
    g1.setXY(200, 200);
    g2.setXY(200, 200);
    g3.setXY(200, 200);
    g4.setXY(200, 200);
    g1.setSpeed(g1.getSpeed() + .1);
    g2.setSpeed(g2.getSpeed() + .1);
    g3.setSpeed(g3.getSpeed() + .1);
    g4.setSpeed(g4.getSpeed() + .1);
    level++;
    fill(255);
    background(0);
    textSize(50);
    text("level " + level, 125, 200);
    textSize(12);
    p.setDir(-1);
    dotsLeft = dotMax;
    for (int i = 0; i < dotMax; i++) {
      dotVis[i] = true;
    }
    
    display = false;
  }
}