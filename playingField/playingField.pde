import java.util.*;

ArrayList<monkey> monkeys;
ArrayList<allBalloons> balloons;
path p;
boolean clickedOnLogo;

void setup() {
  frameRate(60);
  size(1500, 800);
  initialize();
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
  background(255);
  p.display();
  int temp = 0;
  for (int i = 0; i < balloons.size(); i++){
    balloons.get(i).display();
  }
  if (frameCount%45==0){
    if (p.hasNextPoint(temp)){
      balloons.get(0).move(p.getNextPoint(temp)[0],p.getNextPoint(temp)[1]);
    }
  }
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
