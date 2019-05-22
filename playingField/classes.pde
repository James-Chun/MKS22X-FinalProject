import java.util.*;

class monkey {

  float x, y, w, h;
  monkey(float xPos, float yPos, float wid, float hei) {
    x = xPos;
    y = yPos;
    w = wid;
    h = hei;
  }

  void display() {
    fill(255);
    ellipse(x, y, w, h);
  }
  
  void touchingPath() {
  }
  
  boolean isBetween(int x, int y, int x1, int y1, int x2, int y2) {
    if (dist(x, y, x1, y1) + dist(x, y, x2, y2) == dist(x1, y1, x2, y2)) {
      return true;
    }
    return false;
  }
}

class balloon {
  balloon() {
  }
}

class path {

  int[][] randPoints;

  path(int totalPoints) {
    randPoints = new int[totalPoints][2];
  }

  void display() {
    makePath();
    for (int i = 1; i < randPoints.length; i++) {
      //println(Arrays.toString(randPoints[i]));
      line(randPoints[i-1][0], randPoints[i-1][1], randPoints[i][0], randPoints[i][1]);
    }
  }

  void makePath() {
    for (int r = 0; r < randPoints.length; r++) {
      for (int c = 0; c < randPoints[0].length; c++) {
        randPoints[r][c] = (int) random(800);
      }
    }
  }
}
