import java.util.*;

ArrayList<monkey> monkeys;
ArrayList<allBalloons> balloons;
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
  balloons = new ArrayList<allBalloons>();
  p = new path(10); //number of points on the path
  monkeys.add(new monkey(100, 100, 40, 40)); // first thing added is always the logo
  balloons.add(new allBalloons(p.getStart()[0]-35,p.getStart()[1]-40));
  //balloons.add(new allBalloons(100,100));
}

void draw() {
  for (int i = 1; i < monkeys.size(); i++) {
    monkeys.get(i).display();
  }
  for (int i = 0; i < balloons.size(); i++){
    balloons.get(i).display();
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