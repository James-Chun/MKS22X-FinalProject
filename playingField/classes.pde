import java.util.*;


//For all classes: x - x-coord, y - y-coord, w - width of image, h - height of image.


//----------------------------------------------------------------------------------------
//vvvvvvvvvv
class monkey {
    float x, y, w, h;
    
    monkey(float xPos, float yPos, float wid, float hei) { //constructor
        x = xPos;
        y = yPos;
        w = wid;
        h = hei;
    }
    
    float getX() {
        return x;
    }
    float getY() {
        return y;
    }
    
    void display() {
        fill(255);
        strokeWeight(1);
        ellipse(x, y, w, h);
    }
    
    void touchingPath() {
    }
  
    
    boolean isBetween(int x, int y, int x1, int y1, int x2, int y2) {
        if (dist(x, y, x1, y1) + dist(x, y, x2, y2) == dist(x1, y1, x2, y2)) {
          return true;
        }
        return false;
    }
    
}
//^^^^^^^^^^  monkey
//----------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------
//vvvvvvvvvv
class allBalloons {
    ArrayList<balloon> balloons;
    
    //----------------------------------------------------------------------------------------
    //vvvvvvvvvv
    class balloon{
        float x, y, w, h;
        PImage img;
        int point; //keeping track of which point the balloon is heading towards
        
        balloon(float x1, float y1, float width, float height, int p){
            x = x1;
            y = y1;
            w = width;
            h = height;
            img = loadImage("balloon.png");
            point = p;
        }
        
        void display() {
            fill(0);
            rectMode(CENTER);
            image(img, x, y, w, h);
        }
        
        void setX(float newX){
            x = newX;
        }
        void setY(float newY){
            y = newY;
        }
        
        int getPoint(){
            return point;
        }
        void setPoint(int newPoint){
            point = newPoint;
        }
        float getX(){
            return x;
        }
        float getY(){
            return y;
        }
        
        
    }
    //^^^^^^^^^^  balloon
    //----------------------------------------------------------------------------------------


   
    allBalloons(float x2, float y2) {
        balloons = new ArrayList<balloon>();
        balloons.add(new balloon(x2, y2, 70, 80, 0));
    }
    
    
    void display() {
        for (balloon b : balloons) {
          b.display();
        }
    }   
    
    void move(float newX, float newY){
        for (int i=0;i<balloons.size();i++){
          balloons.get(i).setX(newX);
          balloons.get(i).setY(newY);
        }
    }
    
    int getPointOnLine(int i){
        return balloons.get(i).getPoint();
    }
    void setPoint(int i, int newPoint){
        balloons.get(i).setPoint(newPoint);
    }
    
    
        float getX(int i){
            return balloons.get(i).getX();
        }
        float getY(int i){
            return balloons.get(i).getY();
        }
    
}
//^^^^^^^^^^  allBalloons
//----------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------
//vvvvvvvvvv
class path {
    int[][] randPoints;
  
    path(int totalPoints) {//creating path with specified number of points
        randPoints = new int[totalPoints][2];
        makePath();
    }
  
    void display() {
        for (int i = 1; i < randPoints.length; i++) {
            //println(Arrays.toString(randPoints[i]));
            strokeWeight(20);
            line(randPoints[i-1][0], randPoints[i-1][1], randPoints[i][0], randPoints[i][1]);
        }
    }

    void makePath() {
        int spacing = (int) width / randPoints.length;
        for (int r = 0; r < randPoints.length; r++) {
            randPoints[r][0] = (int) random(spacing * r, spacing * (r+1));
        }
        for (int r = 0; r < randPoints.length; r++) {
            randPoints[r][1] = (int) random(height);
        }
    }
    
    int[] getStart(){
        return randPoints[0];
    }
    
    int[] getEnd(){
        return randPoints[randPoints.length-1];
    }
    
    int[] getNextPoint(int index){
        return randPoints[index+1];
    }
    int[] getPoint(int index){
      return randPoints[index];
    }
    boolean hasNextPoint(int index){
        return index<=randPoints.length-2;
    }
    
}
//^^^^^^^^^^  path
//----------------------------------------------------------------------------------------