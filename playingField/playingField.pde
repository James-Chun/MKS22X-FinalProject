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
  p.display();
}

void initialize() {
  clickedOnLogo = false;
  monkeys = new ArrayList<monkey>();
  balloons = new ArrayList<balloon>();
  p = new path(10);
  monkeys.add(new monkey(100, 100, 40, 40)); // first thing added is always the logo
}

void draw() {
  float easing = 1.0;
  float x = monkeys.get(0).getX();
  float y = monkeys.get(0).getY();
  for (int i = 1; i < monkeys.size(); i++) {
    monkeys.get(i).display();
  }
  if (clickedOnLogo) {
    float targetX = mouseX;
    float dx = targetX - x;
    x += dx * easing;
    float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;
  
  ellipse(x, y, 66, 66);
  }
}

void mousePressed() {
  if (mouseX <= 140 && mouseX >= 60 && mouseY <= 140 && mouseY >= 60) {
    clickedOnLogo = true;
  }
}

void mouseReleased() {
  if (clickedOnLogo) {
    monkeys.add(new monkey(mouseX, mouseY, 40, 40));
    clickedOnLogo = false;
  }
}