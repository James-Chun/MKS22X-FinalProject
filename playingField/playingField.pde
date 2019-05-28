import java.util.*;

ArrayList<monkey> monkeys;
ArrayList<balloon> balloons;
path p;
boolean clickedOnLogo;

void setup() {
  size(1500, 800);
  initialize();
  for (int i = 0; i < monkeys.size(); i++) {
    monkeys.get(i).display();
  }
}

void initialize() {
  clickedOnLogo = false;
  monkeys = new ArrayList<monkey>();
  balloons = new ArrayList<balloon>();
  p = new path(10);
  monkeys.add(new monkey(100, 100, 40, 40, p)); // first thing added is always the logo
}

int firstXBoundary(int[][] points, int xValue) {
  for (int i = 1; i < points.length; i++) {
    if (points[i][0] >= xValue) {
      //println(i - 1);
      return i - 1;
    }
  }
  return -1;
}

float distanceFromPointToLine(int[][] points, int index, float x, float y) {
  int[] firstPoint = points[index];
  int[] secondPoint = points[index+1];
  //int dy = secondPoint[1] - firstPoint[1];
  //int dx = secondPoint[0] - firstPoint[0];
  return distanceFromPointToLineHelper(firstPoint, secondPoint, x, y);
}

float distanceFromPointToLineHelper(int[] p1, int[] p2, float x, float y) {
  float dy = (float) (p2[1] - p1[1]);
  float dx = (float) (p2[0] - p1[0]);
  float slope = dy / dx;
  float b = p2[1] - (slope * p2[1]);
  return (abs((slope * x) - y + b)) / sqrt((slope * slope) + 1);
}

void draw() {
  background(200);
  p.display();
  float easing = 1.0;
  float x = monkeys.get(0).getX();
  float y = monkeys.get(0).getY();
  for (int i = 0; i < monkeys.size(); i++) {
    monkeys.get(i).display();
  }
  if (clickedOnLogo) {
    float targetX = mouseX;
    float dx = targetX - x;
    x += dx * easing;
    float targetY = mouseY;
    float dy = targetY - y;
    y += dy * easing;
    ellipse(x, y, 40, 40);
  }
}

void mousePressed() {
  if (mouseX <= 140 && mouseX >= 60 && mouseY <= 140 && mouseY >= 60) {
    clickedOnLogo = true;
  }
}

void mouseReleased() {
  if (clickedOnLogo) {
    println(distanceFromPointToLine(p.getRandPoints(), firstXBoundary(p.getRandPoints(), (int)mouseX), mouseX, mouseY));
    if (distanceFromPointToLine(p.getRandPoints(), firstXBoundary(p.getRandPoints(), (int)mouseX), mouseX, mouseY) > 30) {
      monkeys.add(new monkey(mouseX, mouseY, 20, 20, p));
    }
    clickedOnLogo = false;
  }
}
