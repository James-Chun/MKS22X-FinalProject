import java.util.*;



ArrayList<monkey> monkeys;
allBalloons balloons;
allProjectiles arrows;
path p;
boolean clickedOnLogo;


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


  p = new path(10); //creating path wit specified points on pathh    
  monkeys.add(new monkey(100, 100, 40, 40, p, 350)); // first thing added is always the logo
  balloons.add( p.getStart()[0], p.getStart()[1], 4, 1);
  balloons.add( p.getStart()[0], p.getStart()[1], 2, 20);
  balloons.add( p.getStart()[0], p.getStart()[1], 1, 1);
  arrows.add( 10, 10, 1, balloons.get(1));
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



//----------------------------------------------------------------------------------------
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
void draw() {
  background(34, 139, 34);
  p.display();
  float easing = 1.0;
  float x = monkeys.get(0).getX();
  float y = monkeys.get(0).getY();

  for (int i = 0; i < balloons.size(); i++) {    //balloon display
    balloon currentBalloon = balloons.get(i);

    if ( currentBalloon.getHealth() == 0) balloons.remove(i);

    currentBalloon.display();

    if ( second()%1==0 && p.hasNextPoint(currentBalloon.getPoint()) ) {    //balloon movement

      float thisX = currentBalloon.getX();
      float thisY = currentBalloon.getY();
      float nextX = p.getNextPoint( currentBalloon.getPoint() )[0];
      float nextY = p.getNextPoint( currentBalloon.getPoint() )[1];

      //currentBalloon.move( nextX , nextY ); //each balloon uses its own point tracker to find the coords of the next point and moves to that point
      currentBalloon.setX( thisX + (currentBalloon.getSpeed() * (nextX - thisX))/(dist(thisX, thisY, nextX, nextY)) );
      currentBalloon.setY( thisY + (currentBalloon.getSpeed() * (nextY - thisY))/(dist(thisX, thisY, nextX, nextY)) );
      if ( thisX >= nextX ) {
        currentBalloon.setPoint( currentBalloon.getPoint()+1 );
      }
    } else if ( !p.hasNextPoint( currentBalloon.getPoint() ) ) {
      balloons.remove(i);
    }
  }


  for (int i = 0; i < monkeys.size(); i++) {    //monkey display
    monkeys.get(i).display();
    //monkeys.get(i).attack(balloons.getAllBalloons());
  }


  for (int i = 0; i < arrows.size(); i++) {    //arrow display
    arrows.get(i).display();
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
    monkeys.get(0).rangeDisplay(mouseX, mouseY);
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
}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//----------------------------------------------------------------------------------------



//----------------------------------------------------------------------------------------
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
void mouseReleased() {
  if (clickedOnLogo) {
    //println(distanceFromPointToLine(p.getRandPoints(), firstXBoundary(p.getRandPoints(), (int)mouseX), mouseX, mouseY));
    if (distanceFromPointToLine(p.getRandPoints(), firstXBoundary(p.getRandPoints(), (int)mouseX), mouseX, mouseY) > 30) {
      monkeys.add(new monkey(mouseX, mouseY, 40, 40, p, 150));
    }
    clickedOnLogo = false;
  }
}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//----------------------------------------------------------------------------------------
