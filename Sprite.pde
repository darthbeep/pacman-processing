public class Sprite {

  int x;
  int y;
  int cdir;
  int sdir;
  double speed;
  int phase;

  float counter;
  public Sprite() {
    x = 200;
    y = 200;
    cdir = -1;
    sdir = -1;
    phase = 0;
  }

  public Sprite(int xc, int yc, double s) {
    x = xc;
    y = yc;
    cdir = -1;
    sdir = -1;
    speed = s;
    phase = 0;
    counter =0;
  }


  public void show(int identity) {
    if(identity == 0) {
      if (cdir == 3) {
        image(pacman[phase%4], (x-10), (y-10), 20, 20);
      }
      else if (cdir == 1) {
      rotate(PI);
      image(pacman[phase%4], -(x+10), -(y+10), 20, 20);
      rotate(PI);
      }
      else if (cdir == 0) {
      rotate(HALF_PI);
      image(pacman[phase%4], (y-10), -(x+10), 20, 20);
      rotate(HALF_PI+PI);
      }
      else if (cdir == 2) {
      rotate(HALF_PI + PI);
      image(pacman[phase%4], -(y+10), (x-10), 20, 20);
      rotate(HALF_PI);
      }
      else image(pacman[0], x-10, y-10, 20,20);
    }
    else if (identity == 1) {
      image(g1I[phase%8], x-10, y-10, 20, 20);
    }
    else if (identity == 2) {
      image(g2I[phase%8], x-10, y-10, 20, 20);
    }
    else if (identity == 3) {
      image(g3I[phase%8], x-10, y-10, 20, 20);
    }
    else if (identity == 4) {
      image(g4I[phase%8], x-10, y-10, 20, 20);
    }
    else ellipse(x, y, 20, 20);
    phase++;
  }

  public void setDir(int d) {
    sdir = d;
  }

  public void move() {
    if (changeDir(sdir)) {
      cdir = sdir;
    } else {
      if (!changeDir(cdir)) 
        cdir = -1;
    }
    if (cdir == 0) {
      x = x+1;
    }
    if (cdir == 1) {
      y = y+1;
    }
    if (cdir == 2) {
      x = x-1;
    }
    if (cdir == 3) {
      y = y-1;
    }
    if (x < 0) x = 400;
    if (x > 400) x = 0;
    if (y < 0) y = 400;
    if (y > 400) y = 0;
  }

  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
  public int getDir() {
    return cdir;
  }
  boolean changeDir(int nDir) {
    if (nDir == 0) {
      for (int i = 0; i < numWallsV; i++) {
        //System.out.println(h[i]-p.getX());
        if ((v[i]-this.getX()) == 15
          && vt[i] > this.getY() -10 && vb[i] < this.getY() +10
          ) {
          return false;
        }
      }
      for (int i = 0; i < numWallsH; i++) {
        if ((hb[i]-this.getX()) <= 10
          && h[i] > this.getY() -15 && h[i] < this.getY() +15
          ) {
          return false;
        }
      }
    }
    if (nDir == 1) {
      for (int i = 0; i < numWallsH; i++) {
        //System.out.println(h[i]-p.getX());
        if ((h[i]-this.getY()) == 15
          && ht[i] > this.getX() -10 && hb[i] < this.getX() +10
          ) {
          return false;
        }
      }
      for (int i = 0; i < numWallsV; i++) {
        if ((vb[i]-this.getY()) <= 10
          && v[i] > this.getX() -15 && v[i] < this.getX() +15
          ) {
          return false;
        }
      }
    }
    if (nDir == 2) {
      for (int i = 0; i < numWallsV; i++) {
        //System.out.println(h[i]-p.getX());
        if ((v[i]-this.getX()) == -15
          && vt[i] > this.getY() -10 && vb[i] < this.getY()+10
          ) {
          return false;
        }
      }
      for (int i = 0; i < numWallsH; i++) {
        if ((ht[i]-this.getX()) <= -10
          && h[i] > this.getY() -15 && h[i] < this.getY() +15
          ) {
          return false;
        }
      }
    }
    if (nDir == 3) {
      for (int i = 0; i < numWallsH; i++) {
        //System.out.println(h[i]-p.getX());
        if ((h[i]-this.getY()) == -15
          && ht[i] > this.getX() - 10 && hb[i] < this.getX() + 10
          ) {
          return false;
        }
      }
      for (int i = 0; i < numWallsV; i++) {
        if ((vt[i]-this.getY()) >= -10
          && v[i] > this.getX() -15 && v[i] < this.getX() +15
          ) {
          return false;
        }
      }
    }
    return true;
  }
  void detect() {
    if (p.x == this.x) {
      if (this.getY() > p.getY()) this.setDir(3);
      else if (g4.getY() < p.getY()) g4.setDir(1);
    }
    if (p.y == this.y) {
      if (this.getX() > p.getX()) this.setDir(2);
      else if (this.getX() < p.getX()) this.setDir(0);
    }
  }
  void setXY(int nx, int ny) {
    x = nx;
    y = ny;
  }
  double getSpeed() {
    return speed;
  }
  void setSpeed(double s) {
    speed = s;
  }
}