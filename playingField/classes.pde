import java.util.*;


//For all classes: x - x-coord, y - y-coord, w - width of image, h - height of image.

class path {
  int[][] randPoints;
  PImage path;

  path(int totalPoints) {//creating path with specified number of points
    randPoints = new int[totalPoints][2];
    makePath();
    path = loadImage("path.png");
  }

  void display() {
    for (int i = 1; i < randPoints.length; i++) {
      strokeWeight(20);            
      pushMatrix();
      if (randPoints[i-1][1] > randPoints[i][1]) {
        translate(randPoints[i-1][0], randPoints[i-1][1]);
        rotate(PI + asin( -(randPoints[i-1][0] - randPoints[i][0]) / sqrt((randPoints[i-1][0]-randPoints[i][0])*(randPoints[i-1][0]-randPoints[i][0]) + (randPoints[i-1][1]-randPoints[i][1])*(randPoints[i-1][1]-randPoints[i][1]) ) ) );
      } else {
        translate(randPoints[i-1][0], randPoints[i-1][1]);
        rotate( asin( (randPoints[i-1][0] - randPoints[i][0]) / sqrt((randPoints[i-1][0]-randPoints[i][0])*(randPoints[i-1][0]-randPoints[i][0]) + (randPoints[i-1][1]-randPoints[i][1])*(randPoints[i-1][1]-randPoints[i][1]) ) ) );
      }
      image(path, -20, -10, 40, 20 + sqrt((randPoints[i-1][0]-randPoints[i][0])*(randPoints[i-1][0]-randPoints[i][0]) + (randPoints[i-1][1]-randPoints[i][1])*(randPoints[i-1][1]-randPoints[i][1]) ));
      popMatrix();
    }
  }
  void makePath() {
    int spacing = (int) width / randPoints.length;
    for (int r = 0; r < randPoints.length; r++) {
      if (r == 0) {
        randPoints[r][0] = 0;
      } else if (r == randPoints.length -1) {
        randPoints[r][0] = width;
      } else {
        randPoints[r][0] = (int) random(spacing * r, spacing * (r+1));
      }
    }
    for (int r = 0; r < randPoints.length; r++) {
      randPoints[r][1] = (int) random(height);
    }
  }

  int[] getStart() {
    return randPoints[0];
  }

  int[] getEnd() {
    return randPoints[randPoints.length-1];
  }

  int[] getNextPoint(int index) {
    return randPoints[index+1];
  }
  int[] getPoint(int index) {
    return randPoints[index];
  }
  boolean hasNextPoint(int index) {
    return index<=randPoints.length-2;
  }

  int[][] getRandPoints() {
    return randPoints;
  }
}
