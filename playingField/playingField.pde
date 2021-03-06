import java.util.*;



ArrayList<monkey> monkeys;
allBalloons balloons;
allProjectiles arrows;
path p;
boolean clickedOnLogo, broke;
int wave, speedClicks, hp, money;


//----------------------------------------------------------------------------------------
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
void setup() { //setting the frameRate, size of the world, and initializing
  frameRate(60);
  size(1500, 800);
  //fullScreen();
  initialize();
}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ setup ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//----------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
void initialize() { // creating the list of monkeys and balloons as well as the path
  clickedOnLogo = false;
  monkeys = new ArrayList<monkey>();
  balloons = new allBalloons();
  arrows = new allProjectiles();
  wave = 0;
  p = new path(10); //creating path wit specified points on path
  speedClicks = 0;
  hp = 100;
  money = 450;
  broke = false;

  monkeys.add(new monkey(40, height - 40, 150, 150, p, 400)); // first thing added is always the logo
}

int firstXBoundary(int[][] points, int xValue) {
  //println(points.length);
  for (int i = 1; i < points.length; i++) {
    if (points[i][0] >= xValue) {
      //println(i - 1);
      return i - 1;
    }
  }
  return 8;
}

float distanceFromPointToLine(int[][] points, int index, float x, float y) {
  int[] firstPoint = points[index];
  int[] secondPoint = points[index+1];
  return distanceFromPointToLineHelper(firstPoint, secondPoint, x, y);
}

float distanceFromPointToLineHelper(int[] p1, int[] p2, float x, float y) {
  float dy = (float) (p2[1] - p1[1]);
  float dx = (float) (p2[0] - p1[0]);
  float slope = dy / dx;
  //println("slope: " + slope);
  float b = p2[1] - (slope * p2[0]); // take into account that (0,0) is the upper left corner
  return (abs((slope * x) - y + b)) / sqrt((slope * slope) + 1);
}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ initialize ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
//----------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
void draw() {
  background(34, 139, 34);
  //Collections.sort(balloons.getAllBalloons(), Collections.reverseOrder()); // this is very taxing and makes the program stop at a certain stage
  p.display();
  fill(255);
  textSize(50);
  text("Health: " + hp, width - 300, 70);
  text("$" + 200, 65, height - 30);
  if (broke) fill(255, 0, 0);
  text("$: " + money, 15, 70);
  image(loadImage("playButton.png"), 1350, 700, 160, 130); // play button
  image(loadImage("fastForwardButton.png"), 1200, 700, 160, 130);
  float easing = 1.0;
  float x = monkeys.get(0).getX();
  float y = monkeys.get(0).getY();


  for (int i = 0; i < balloons.size(); i++) {    //balloon display
    balloon currentBalloon = balloons.get(i);
    if ( currentBalloon.getHealth() == 0) balloons.remove(i);
    currentBalloon.display();
    currentBalloon.move();
  }


  for (int i = 0; i < monkeys.size(); i++) {    //monkey display
    monkeys.get(i).display();
    if (i > 0) {
      monkeys.get(i).attack(balloons.getAllBalloons());
    }
  }

  for (int i = 0; i < arrows.size(); i++) {    //arrow display
    arrows.get(i).moveTo();
    //println("yes");
  }

  if (clickedOnLogo) {
    float targetX = mouseX;
    float dx = targetX - x;
    x += dx * easing;
    float targetY = mouseY;
    float dy = targetY - y;
    y += dy * easing;
    monkeys.get(0).display(mouseX, mouseY);
    if (money < 200 || distanceFromPointToLine(p.getRandPoints(), firstXBoundary(p.getRandPoints(), (int)mouseX), mouseX, mouseY) < 50) {
      monkeys.get(0).rangeDisplay(mouseX, mouseY, "red");
    } else {
      monkeys.get(0).rangeDisplay(mouseX, mouseY, "clear");
    }
  }
  if (hp <= 0) {
    println("You Lose");
    exit();
  }
}

//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ draw ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
//----------------------------------------------------------------------------------------



//----------------------------------------------------------------------------------------
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
void mousePressed() {
  if (mouseX <= 60 && mouseX >= 20 && mouseY <= height - 20 && mouseY >= height - 70) {
    if (money < 200) broke = true;
    clickedOnLogo = true;
  }
  if (mouseX <= width && mouseX >= 1350 && mouseY <= height && mouseY >= 700) {
    updateWave();
  }
  if (mouseX <= 1350 && mouseX >= 1200 && mouseY <= height && mouseY >= 700) {
    if (speedClicks == 0) {
      for (int i = 0; i < balloons.size(); i++) {
        balloons.get(i).doubleSpeed();
      }
      for (int i = 0; i < monkeys.size(); i++) {
        monkeys.get(i).setHasten(2);
      }
      speedClicks = 1;
    } else if (speedClicks == 1) {
      for (int i = 0; i < balloons.size(); i++) {
        balloons.get(i).tripleSpeed();
      }
      for (int i = 0; i < monkeys.size(); i++) {
        monkeys.get(i).setHasten(3);
      }
      speedClicks = 2;
    } else if (speedClicks == 2) {
      for (int i = 0; i < balloons.size(); i++) {
        balloons.get(i).quadSpeed();
      }
      for (int i = 0; i < monkeys.size(); i++) {
        monkeys.get(i).setHasten(4);
      }
      speedClicks = 3;
    } else if (speedClicks == 3) {
      for (int i = 0; i < balloons.size(); i++) {
        balloons.get(i).fourthSpeed();
      }
      for (int i = 0; i < monkeys.size(); i++) {
        monkeys.get(i).setHasten(1);
      }
      speedClicks = 0;
    }
  }
  if (mouseX <= 20 && mouseX >= 0 && mouseY <= 20 && mouseY >= 0) {
    balloons.add(p.getStart()[0], p.getStart()[1], 1); 
    balloons.add(p.getStart()[0], p.getStart()[1], 2); 
    balloons.add(p.getStart()[0], p.getStart()[1], 3); 
    balloons.add(p.getStart()[0], p.getStart()[1], 4); 
    balloons.add(p.getStart()[0], p.getStart()[1], 5); 
  }
}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//----------------------------------------------------------------------------------------



//----------------------------------------------------------------------------------------
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
void mouseReleased() {
  if (clickedOnLogo && money >= 200) {
    //println(distanceFromPointToLine(p.getRandPoints(), firstXBoundary(p.getRandPoints(), (int)mouseX), mouseX, mouseY));
    if (distanceFromPointToLine(p.getRandPoints(), firstXBoundary(p.getRandPoints(), (int)mouseX), mouseX, mouseY) > 50) {
      monkeys.add(new monkey(mouseX, mouseY, 150, 150, p, 400));
      money -= 200;
      if (speedClicks == 0) {
        monkeys.get(monkeys.size() - 1).setHasten(1);
      } else if (speedClicks == 1) {
        monkeys.get(monkeys.size() - 1).setHasten(2);
      } else if (speedClicks == 2) {
        monkeys.get(monkeys.size() - 1).setHasten(3);
      } else if (speedClicks == 3) {
        monkeys.get(monkeys.size() - 1).setHasten(4);
      }
    }
  }
  broke = false;
  clickedOnLogo = false;
}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//----------------------------------------------------------------------------------------
