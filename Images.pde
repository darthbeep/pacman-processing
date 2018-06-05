PImage origsheet;
PImage[] pacman;
PImage[] g1I;
PImage[] g2I;
PImage[] g3I;
PImage[] g4I;

void doEverything() {
  loadSheet();
  loadPacman();
  loadG1();
  loadG2();
  loadG3();
  loadG4();
}
void loadSheet() {
  origsheet = loadImage("pacman.png");
}
void loadPacman() {
  pacman = new PImage[4];
  pacman[0] = origsheet.get(0,0,128,128);
  pacman[1] = origsheet.get(128,0,128,128);
  pacman[2] = origsheet.get(256,0,128,128);
  pacman[3] = origsheet.get(384,0,128,128);
}
void loadG1() {
  g1I = new PImage[8];
  for (int i = 0; i < 8; i++) {
    g1I[i] = origsheet.get(i*128,512,128,128);
  }
}
void loadG2() {
  g2I = new PImage[8];
  for (int i = 0; i < 8; i++) {
    g2I[i] = origsheet.get(i*128,640,128,128);
  }
}
void loadG3() {
  g3I = new PImage[8];
  for (int i = 0; i < 8; i++) {
    g3I[i] = origsheet.get(i*128,768,128,128);
  }
}
void loadG4() {
  g4I = new PImage[8];
  for (int i = 0; i < 8; i++) {
    g4I[i] = origsheet.get(i*128,896,128,128);
  }
}