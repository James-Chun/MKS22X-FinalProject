import java.util.*;

ArrayList<monkey> monkeys;
ArrayList<balloon> balloons;
ArrayList<path> path;
boolean clickedOnLogo;

void setup() {
  size(1800, 1000);
  initialize();
  for (int i = 0; i < monkeys.size(); i++) {
    monkeys.get(i).display();
  }
}

void initialize() {
  clickedOnLogo = false;
  monkeys = new ArrayList<monkey>();
  balloons = new ArrayList<balloon>();
  path = new ArrayList<path>();
  monkeys.add(new monkey(100, 100, 40, 40)); // first thing added is always the logo
}

void draw() {
  for (int i = 1; i < monkeys.size(); i++) {
    monkeys.get(i).display();
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
