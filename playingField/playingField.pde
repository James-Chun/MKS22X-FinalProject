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
    monkeys.add(new monkey(100, 100, 40, 40)); // first thing added is always the logo
    balloons.add( p.getStart()[0] , p.getStart()[1] , 4 , 100);
    balloons.add( p.getStart()[0] , p.getStart()[1] , 2 , 50 );
    balloons.add( p.getStart()[0] , p.getStart()[1] , 1 , 25);
    arrows.add( 40 , 40 , 10);
}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ initialize ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
//----------------------------------------------------------------------------------------



//----------------------------------------------------------------------------------------
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
void draw() {
    background(255);
    p.display();
    
    for (int i = 0; i < balloons.size(); i++){    //balloon display
        balloon currentBalloon = balloons.get(i);
        
        currentBalloon.display();
        
        if ( frameCount%1==0 && p.hasNextPoint(currentBalloon.getPoint()) ){
          
            float thisX = currentBalloon.getX();
            float thisY = currentBalloon.getY();
            float nextX = p.getNextPoint( currentBalloon.getPoint() )[0];
            float nextY = p.getNextPoint( currentBalloon.getPoint() )[1];
          
            //currentBalloon.move( nextX , nextY ); //each balloon uses its own point tracker to find the coords of the next point and moves to that point
            currentBalloon.setX( thisX + (currentBalloon.getSpeed() * (nextX - thisX))/(dist(thisX,thisY,nextX,nextY)) );
            currentBalloon.setY( thisY + (currentBalloon.getSpeed() * (nextY - thisY))/(dist(thisX,thisY,nextX,nextY)) );
            if ( thisX >= nextX ){
                currentBalloon.setPoint( currentBalloon.getPoint()+1 );
            }
            
        }
        
        else if ( !p.hasNextPoint( currentBalloon.getPoint() ) ){
            balloons.remove(i);
        }
    }
    
    
    for (int i = 1; i < monkeys.size(); i++) {    //monkey display
        monkeys.get(i).display();
    }
    
    
    for (int i = 0; i < arrows.size(); i++){    //arrow display
        projectile currentArrow = arrows.get(i);
        
        arrows.get(i).display();
        
        if ( frameCount%1==0 && ( Math.abs( currentArrow.getX() - balloons.get(i).getX() ) <= 10 && Math.abs( currentArrow.getY() - balloons.get(i).getY() ) <= 10 ) ){
          
            float thisX = currentArrow.getX();
            float thisY = currentArrow.getY();
            float nextX = balloons.get(i).getX();
            float nextY = balloons.get(i).getY();
          
            //each arrow tracks balloon's coords and continously moves towards them  
            currentArrow.setX( thisX + (15 * (nextX - thisX))/(dist(thisX,thisY,nextX,nextY)) );
            currentArrow.setY( thisY + (15 * (nextY - thisY))/(dist(thisX,thisY,nextX,nextY)) );
        }
        else if ( Math.abs( currentArrow.getX() - balloons.get(i).getX() ) <= 10 && Math.abs( currentArrow.getY() - balloons.get(i).getY() ) <= 10 ){
            arrows.remove(i);
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
}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//----------------------------------------------------------------------------------------



//----------------------------------------------------------------------------------------
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
void mouseReleased() {
    if (clickedOnLogo) {
        monkeys.add(new monkey(mouseX, mouseY, 40, 40));
        clickedOnLogo = false;
    }
}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//----------------------------------------------------------------------------------------
