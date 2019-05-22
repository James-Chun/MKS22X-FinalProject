import java.util.*;

ArrayList<monkey> monkeys;
ArrayList<allBalloons> balloons;
path p;
boolean clickedOnLogo;

void setup() {
<<<<<<< HEAD
  size(900, 600);
=======
  size(1000, 800);
>>>>>>> d5021da4d03590d76f303faf13a8438e82489ec4
  initialize();
  for (int i = 0; i < monkeys.size(); i++) {
    monkeys.get(i).display();
  }
  p.display();
}

void initialize() {
  clickedOnLogo = false;
  monkeys = new ArrayList<monkey>();
<<<<<<< HEAD
  balloons = new ArrayList<allBalloons>();
  p = new path(100, 100, 400, 100);
=======
  balloons = new ArrayList<balloon>();
  p = new path(10);
>>>>>>> d5021da4d03590d76f303faf13a8438e82489ec4
  monkeys.add(new monkey(100, 100, 40, 40)); // first thing added is always the logo
  balloons.add(new allBalloons(50,50));
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
