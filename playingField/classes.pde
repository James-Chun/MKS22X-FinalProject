import java.util.*;

class monkey {

  float x, y, w, h;
  monkey(float xPos, float yPos, float wid, float hei) {
    x = xPos;
    y = yPos;
    w = wid;
    h = hei;
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
  
  void display() {
    fill(255);
    strokeWeight(1);
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
      strokeWeight(20);
      line(randPoints[i-1][0], randPoints[i-1][1], randPoints[i][0], randPoints[i][1]);
    }
  }

  void makePath() {
    int spacing = (int) width / randPoints.length;
    for (int r = 0; r < randPoints.length; r++) {
      randPoints[r][0] = (int) random(spacing * r, spacing * (r+1));
    }
    for (int r = 0; r < randPoints.length; r++) {
      randPoints[r][1] = (int) random(height);
    }
  }
}