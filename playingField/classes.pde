import java.util.*;

class monkey {

  int[][] allPoints;
  float x, y, w, h;
  monkey(float xPos, float yPos, float wid, float hei, path p) {
    x = xPos;
    y = yPos;
    w = wid;
    h = hei;
    allPoints = p.getRandPoints();
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  void display() {
    fill(255);
    ellipse(x, y, w, h);
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
    makePath();
  }

  void display() {
    for (int i = 1; i < randPoints.length; i++) {
      //println(Arrays.toString(randPoints[i]));
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

  int[][] getRandPoints() {
    return randPoints;
  }
}
