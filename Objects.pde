void setupStage() {
  hn = 0;
  vn = 0;
  //Horizontal
  createWallH(5, 0, 190);
  createWallH(5, 210, 400);
  createWallH(395, 0, 190);
  createWallH(395, 210, 400);
  createWallH(35, 30, 370);
  createWallH(365, 30, 370);
  createWallH(65, 60, 190);
  createWallH(65, 210, 340);
  createWallH(335, 60, 190);
  createWallH(335, 210, 340);
  createWallH(95, 60, 190);
  createWallH(95, 210, 340);
  createWallH(305, 60, 190);
  createWallH(305, 210, 340);
  createWallH(125, 240, 310);
  createWallH(275, 240, 310);
  createWallH(155, 220, 265);
  createWallH(155, 285, 330);
  createWallH(245, 220, 265);
  createWallH(245, 285, 330);
  createWallH(185, 240, 310);
  createWallH(215, 240, 310);
  //createWallH(125, 190, 210);
  createWallH(275, 190, 210);
  //Vertical
  createWallV(5, 0, 190);
  createWallV(5, 210, 400);
  createWallV(395, 0, 190);
  createWallV(395, 210, 400);
  createWallV(35, 40, 100);
  createWallV(365, 40, 100);
  createWallV(35, 300, 360);
  createWallV(365, 300, 360);
  createWallV(35, 120, 190);
  createWallV(365, 120, 190);
  createWallV(35, 210, 280);
  createWallV(365, 210, 280);
  createWallV(65, 120, 280);
  createWallV(335, 120, 280);
  createWallV(185, 120, 280);
  createWallV(215, 120, 280);
  createWallV(125, 120, 280);
  createWallV(95, 120, 190);
  createWallV(95, 210, 280);
  createWallV(155, 120, 190);
  createWallV(155, 210, 280);
}
void createWallH(int y, int x1, int x2) {
  /*line(x-5, y1, x-5, y2);
   line(x+5, y1, x+5, y2);
   line(x-5, y1, x+5, y1);
   line(x-5, y2, x+5, y2);*/
  h[hn] = y;
  if (x1 > x2) {
    ht[hn] = x1;
    hb[hn] = x2;
  } else {
    ht[hn] = x2;
    hb[hn] = x1;
  }
  rect(ht[hn], h[hn]-5, hb[hn]-ht[hn], 10);
  hn++;
}
void createWallV(int x, int y1, int y2) {
  /*line(x-5, y1, x-5, y2);
   line(x+5, y1, x+5, y2);
   line(x-5, y1, x+5, y1);
   line(x-5, y2, x+5, y2);*/
  v[vn] = x;
  if (y1 > y2) {
    vt[vn] = y1;
    vb[vn] = y2;
  } else {
    vt[vn] = y2;
    vb[vn] = y1;
  }
  rect(v[vn]-5, vb[vn], 10, vt[vn]-vb[vn]);
  vn++;
}
void createDot(int x, int y) {
  if (dotVis[dn]) ellipse(x, y, 10, 10);
  dx[dn] = x;
  dy[dn] = y;
  dn++;
}
void setupDots() {
  for (int i = 0; i < 13; i++) {
    for (int j = 0; j < 13; j++)
      createDot(i * 30 + 20, j * 30 + 20);
  }
  dn = 0;
}
void killDot() {
  for (int i = 0; i < dotMax; i++) {
    if (p.getX() == dx[i] && p.getY() == dy[i]) {
      if (dotVis[i]) dotsLeft--;
      dotVis[i] = false;
    }
  }
}