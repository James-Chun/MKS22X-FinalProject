import java.util.*;



ArrayList<monkey> monkeys;
allBalloons balloons;
allProjectiles arrows;
path p;
boolean clickedOnLogo;
int wave;


//----------------------------------------------------------------------------------------
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
void setup() { //setting the frameRate, size of the world, and initializing
  frameRate(60);
  size(1500, 800);
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

  monkeys.add(new monkey(100, 100, 150, 150, p, 350)); // first thing added is always the logo
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
  //println("slope: " + slope);
  float b = p2[1] - (slope * p2[0]); // take into account that (0,0) is the upper left corner
  return (abs((slope * x) - y + b)) / sqrt((slope * slope) + 1);
}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ initialize ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
//----------------------------------------------------------------------------------------

void updateWave() {
  int spacing = 1;
  if (balloons.size() == 0) {
    wave++;
    if (wave == 1) {
      balloons.add(p.getStart()[0], p.getStart()[1], 1, 1); // first balloon added doesnt get changed by spacing
      balloons.add(p.getStart()[0] - (p.getPoint(1)[0] - p.getPoint(0)[0]) / 5 * spacing, p.getStart()[1] - (p.getPoint(1)[1] - p.getPoint(0)[1]) / 5 * spacing, 1, 1);
      spacing++;
      balloons.add(p.getStart()[0] - (p.getPoint(1)[0] - p.getPoint(0)[0]) / 5 * spacing, p.getStart()[1] - (p.getPoint(1)[1] - p.getPoint(0)[1]) / 5 * spacing, 1, 1);
      spacing++;
      balloons.add(p.getStart()[0] - (p.getPoint(1)[0] - p.getPoint(0)[0]) / 5 * spacing, p.getStart()[1] - (p.getPoint(1)[1] - p.getPoint(0)[1]) / 5 * spacing, 1, 1);
      spacing++;
      balloons.add(p.getStart()[0] - (p.getPoint(1)[0] - p.getPoint(0)[0]) / 5 * spacing, p.getStart()[1] - (p.getPoint(1)[1] - p.getPoint(0)[1]) / 5 * spacing, 1, 1);
      spacing++;
      balloons.add(p.getStart()[0] - (p.getPoint(1)[0] - p.getPoint(0)[0]) / 5 * spacing, p.getStart()[1] - (p.getPoint(1)[1] - p.getPoint(0)[1]) / 5 * spacing, 1, 1);
      spacing++;
      balloons.add(p.getStart()[0] - (p.getPoint(1)[0] - p.getPoint(0)[0]) / 5 * spacing, p.getStart()[1] - (p.getPoint(1)[1] - p.getPoint(0)[1]) / 5 * spacing, 1, 1);
      spacing++;
      balloons.add(p.getStart()[0] - (p.getPoint(1)[0] - p.getPoint(0)[0]) / 5 * spacing, p.getStart()[1] - (p.getPoint(1)[1] - p.getPoint(0)[1]) / 5 * spacing, 1, 1);
      spacing++;
      balloons.add(p.getStart()[0] - (p.getPoint(1)[0] - p.getPoint(0)[0]) / 5 * spacing, p.getStart()[1] - (p.getPoint(1)[1] - p.getPoint(0)[1]) / 5 * spacing, 1, 1);
      spacing++;
      balloons.add(p.getStart()[0] - (p.getPoint(1)[0] - p.getPoint(0)[0]) / 5 * spacing, p.getStart()[1] - (p.getPoint(1)[1] - p.getPoint(0)[1]) / 5 * spacing, 1, 1);
      spacing++;
      balloons.add(p.getStart()[0] - (p.getPoint(1)[0] - p.getPoint(0)[0]) / 5 * spacing, p.getStart()[1] - (p.getPoint(1)[1] - p.getPoint(0)[1]) / 5 * spacing, 1, 1);
      spacing++;
      balloons.add(p.getStart()[0] - (p.getPoint(1)[0] - p.getPoint(0)[0]) / 5 * spacing, p.getStart()[1] - (p.getPoint(1)[1] - p.getPoint(0)[1]) / 5 * spacing, 1, 1);
      spacing++;
      balloons.add(p.getStart()[0] - (p.getPoint(1)[0] - p.getPoint(0)[0]) / 5 * spacing, p.getStart()[1] - (p.getPoint(1)[1] - p.getPoint(0)[1]) / 5 * spacing, 1, 1);
      spacing++;
      balloons.add(p.getStart()[0] - (p.getPoint(1)[0] - p.getPoint(0)[0]) / 5 * spacing, p.getStart()[1] - (p.getPoint(1)[1] - p.getPoint(0)[1]) / 5 * spacing, 1, 1);
      spacing++;
      balloons.add(p.getStart()[0] - (p.getPoint(1)[0] - p.getPoint(0)[0]) / 5 * spacing, p.getStart()[1] - (p.getPoint(1)[1] - p.getPoint(0)[1]) / 5 * spacing, 1, 1);
      spacing++;
      balloons.add(p.getStart()[0] - (p.getPoint(1)[0] - p.getPoint(0)[0]) / 5 * spacing, p.getStart()[1] - (p.getPoint(1)[1] - p.getPoint(0)[1]) / 5 * spacing, 1, 1);
      spacing++;
      balloons.add(p.getStart()[0] - (p.getPoint(1)[0] - p.getPoint(0)[0]) / 5 * spacing, p.getStart()[1] - (p.getPoint(1)[1] - p.getPoint(0)[1]) / 5 * spacing, 1, 1);
      spacing++;
      balloons.add(p.getStart()[0] - (p.getPoint(1)[0] - p.getPoint(0)[0]) / 5 * spacing, p.getStart()[1] - (p.getPoint(1)[1] - p.getPoint(0)[1]) / 5 * spacing, 1, 1);
      spacing++;
      balloons.add(p.getStart()[0] - (p.getPoint(1)[0] - p.getPoint(0)[0]) / 5 * spacing, p.getStart()[1] - (p.getPoint(1)[1] - p.getPoint(0)[1]) / 5 * spacing, 1, 1);
      spacing++;
      balloons.add(p.getStart()[0] - (p.getPoint(1)[0] - p.getPoint(0)[0]) / 5 * spacing, p.getStart()[1] - (p.getPoint(1)[1] - p.getPoint(0)[1]) / 5 * spacing, 1, 1);
    }
  }
}

//----------------------------------------------------------------------------------------
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
void draw() {
  background(34, 139, 34);
  p.display();
  image(loadImage("playButton.png"), 1350, 700, 160, 130); // play button
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
    if (distanceFromPointToLine(p.getRandPoints(), firstXBoundary(p.getRandPoints(), (int)mouseX), mouseX, mouseY) < 50) {
      monkeys.get(0).rangeDisplay(mouseX, mouseY, "red");
    } else {
      monkeys.get(0).rangeDisplay(mouseX, mouseY, "clear");
    }
  }
}

//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ draw ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
//----------------------------------------------------------------------------------------



//----------------------------------------------------------------------------------------
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
void mousePressed() {
  if (mouseX <= 140 && mouseX >= 60 && mouseY <= 140 && mouseY >= 60) {
    clickedOnLogo = true;
  }
  if (mouseX <= width && mouseX >= 1350 && mouseY <= height && mouseY >= 700) {
    updateWave();
  }
}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//----------------------------------------------------------------------------------------



//----------------------------------------------------------------------------------------
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
void mouseReleased() {
  if (clickedOnLogo) {
    //println(distanceFromPointToLine(p.getRandPoints(), firstXBoundary(p.getRandPoints(), (int)mouseX), mouseX, mouseY));
    if (distanceFromPointToLine(p.getRandPoints(), firstXBoundary(p.getRandPoints(), (int)mouseX), mouseX, mouseY) > 50) {
      monkeys.add(new monkey(mouseX, mouseY, 150, 150, p, 350));
    }
    clickedOnLogo = false;
  }
}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//----------------------------------------------------------------------------------------
