import java.util.*;


//For all classes: x - x-coord, y - y-coord, w - width of image, h - height of image.
class monkey {

  float x, y, w, h;
  monkey(float xPos, float yPos, float wid, float hei) {
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
    fill(255,0,255);
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




class allBalloons {
  
  ArrayList<balloon> balloons;
  
  class balloon{
    
    float x, y, w, h;
    PImage img;
    
    balloon(float x1, float y1, float width, float height){
      x = x1;
      y = y1;
      w = width;
      h = height;
      img = loadImage("balloon.png");
    }
    
    void display() {
      fill(0);
      rectMode(CENTER);
      image(img, x, y, w, h);
    }
    
  }//balloon end
   
  allBalloons(float x2, float y2) {
    balloons = new ArrayList<balloon>();
    balloons.add(new balloon(x2, y2, 70, 80));
  }
  
  float x, y;
  
  void display() {
    for (balloon b : balloons) {
      b.display();
    }
  }
  
  void move(path p){
    int i = 0;
    for (int b=0;b<balloons.size();b++){
      while (p.hasNextPoint(i)){
        
      }
    }
  }
  
}




class path {

  int[][] randPoints;

  path(int totalPoints) {
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
    return randPoints[index];
  }
  
  boolean hasNextPoint(int index){
    return index<randPoints.length-1;
  }
}
