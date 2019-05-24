import java.util.*;



ArrayList<monkey> monkeys;
ArrayList<allBalloons> balloons;
path p;
boolean clickedOnLogo;


//----------------------------------------------------------------------------------------
//vvvvvvvvvv
void setup() { //setting the frameRate, size of the world, and initializing
    frameRate(60);
    size(1500, 800);
    initialize();
}
//^^^^^^^^^^
//----------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------
//vvvvvvvvvv
void initialize() { // creating the list of monkeys and balloons as well as the path
    clickedOnLogo = false;
    
    monkeys = new ArrayList<monkey>();
    balloons = new ArrayList<allBalloons>();
    
    p = new path(10); //creating path with specified points on path
    
    monkeys.add(new monkey(100, 100, 40, 40)); // first thing added is always the logo
    balloons.add(new allBalloons( p.getStart()[0] , p.getStart()[1] , 4 ));
    //balloons.add(new allBalloons(100,100));
}
//^^^^^^^^^^
//----------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------
//vvvvvvvvvv
void draw() {
    background(255);
    p.display();
    
    for (int i = 0; i < balloons.size(); i++){
        allBalloons currentBalloon = balloons.get(i);
        
        currentBalloon.display();
        
        if ( frameCount%1==0 && p.hasNextPoint(currentBalloon.getPointOnLine(i)) ){
          
            float thisX = currentBalloon.getX(i);
            float thisY = currentBalloon.getY(i);
            float nextX = p.getNextPoint( currentBalloon.getPointOnLine(i) )[0];
            float nextY = p.getNextPoint( currentBalloon.getPointOnLine(i) )[1];
          
            //currentBalloon.move( nextX , nextY ); //each balloon uses its own point tracker to find the coords of the next point and moves to that point
            currentBalloon.move( thisX + (currentBalloon.getSpeed(i) * (nextX - thisX))/(dist(thisX,thisY,nextX,nextY)) , thisY + (currentBalloon.getSpeed(i) * (nextY - thisY))/(dist(thisX,thisY,nextX,nextY)) );
            if ( thisX >= nextX ){
                currentBalloon.setPoint( i, currentBalloon.getPointOnLine(i)+1 );
            }
            
        }
        
        else if ( !p.hasNextPoint( currentBalloon.getPointOnLine(i) ) ){
            balloons.remove(i);
        }
    }
    
    for (int i = 1; i < monkeys.size(); i++) {
        monkeys.get(i).display();
    }
}
//^^^^^^^^^^
//----------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------
//vvvvvvvvvv
void mousePressed() {
    if (mouseX <= 140 && mouseX >= 60 && mouseY <= 140 && mouseY >= 60) {
        clickedOnLogo = true;
    }
}
//^^^^^^^^^^
//----------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------
//vvvvvvvvvv
void mouseReleased() {
    if (clickedOnLogo) {
        monkeys.add(new monkey(mouseX, mouseY, 40, 40));
        clickedOnLogo = false;
    }
}
//^^^^^^^^^^
//----------------------------------------------------------------------------------------
