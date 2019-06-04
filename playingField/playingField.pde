import java.util.*;


ArrayList<monkey> monkeys;
allBalloons balloons;
allProjectiles arrows;
path p;
boolean clickedOnLogo;
boolean pathBoundaries;


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
    balloons.add(p.getStart()[0], p.getStart()[1], 4, 1);
    balloons.add(p.getStart()[0], p.getStart()[1], 2, 1);
    balloons.add(p.getStart()[0], p.getStart()[1], 1, 1);
}
    
int firstXBoundary(int[][] points, int xValue) {
    for (int i = 1; i < points.length; i++) {
        if (points[i][0] >= xValue) {
            return i - 1;
        }
    }
    return -1;
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
    float b = p2[1] - (slope * p2[0]); // take into account that (0,0) is the upper left corner
    return (abs((slope * x) - y + b)) / sqrt((slope * slope) + 1);
}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ initialize ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
//----------------------------------------------------------------------------------------



//----------------------------------------------------------------------------------------
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
void draw() {
    background(34,139,34);
    p.display(pathBoundaries);
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
    
    
    /*for (int i = 0; i < arrows.size(); i++){    //arrow display
        projectile currentArrow = arrows.get(i);
        
        float thisX = currentArrow.getX();
        float thisY = currentArrow.getY();
        float nextX = balloons.get(i).getX();
        float nextY = balloons.get(i).getY();
        
        arrows.get(i).display( nextX - thisX , dist(thisX,thisY,nextX,nextY) );
        
        if ( frameCount%1==0 && ( Math.abs( thisX - nextX ) >= 10 && Math.abs( thisY - nextY ) >= 10 ) ){    //arrow movement
                 
            //each arrow tracks balloon's coords and continously moves towards them  
            currentArrow.setX( thisX + (30 * (nextX - thisX))/(dist(thisX,thisY,nextX,nextY)) );
            currentArrow.setY( thisY + (30 * (nextY - thisY))/(dist(thisX,thisY,nextX,nextY)) );
        }
        else if ( Math.abs( currentArrow.getX() - balloons.get(i).getX() ) <= 10 && Math.abs( currentArrow.getY() - balloons.get(i).getY() ) <= 10 ){
            //System.out.println(balloons.get(i).getHealth() );
            balloons.get(i).takeDamage( currentArrow.getDamage() );
            //System.out.println(balloons.get(i).getHealth() );
            arrows.remove(i);
        }
    }*/



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
        pathBoundaries = true;
    }
}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//----------------------------------------------------------------------------------------



//----------------------------------------------------------------------------------------
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
void mouseReleased() {
  if (clickedOnLogo) {
    //println(distanceFromPointToLine(p.getRandPoints(), firstXBoundary(p.getRandPoints(), (int)mouseX), mouseX, mouseY));
    if (mouseX < 1500 && distanceFromPointToLine(p.getRandPoints(), firstXBoundary(p.getRandPoints(), (int)mouseX), mouseX, mouseY) > 60) {
      monkeys.add(new monkey(mouseX, mouseY, 40, 40, p, 150));
    }
    clickedOnLogo = false;
    pathBoundaries = false;
  }
}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//----------------------------------------------------------------------------------------
