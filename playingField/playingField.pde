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

boolean isBetween(int x, int y, int x1, int y1, int x2, int y2) {
  if (dist(x, y, x1, y1) + dist(x, y, x2, y2) == dist(x1, y1, x2, y2)) {
    return true;
  }
  return false;
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
    for (int i = 1; i < p.getRandPoints().length; i++) { // move this to mouse released
      if (isBetween((int)mouseX, (int)mouseY, p.getRandPoints()[i-1][0], p.getRandPoints()[i-1][1], p.getRandPoints()[i][0], p.getRandPoints()[i][1])) {
        monkeys.add(new monkey(mouseX, mouseY, 40, 40, p));
      }
    }
    clickedOnLogo = false;
  }
}
