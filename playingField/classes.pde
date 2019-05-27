import java.util.*;


//For all classes: x - x-coord, y - y-coord, w - width of image, h - height of image.


//----------------------------------------------------------------------------------------
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
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
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ monkey ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
//----------------------------------------------------------------------------------------



//----------------------------------------------------------------------------------------
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
class balloon{
    float x, y, w, h;
    PImage img;
    int point; //keeping track of which point the balloon is heading towards
    int speed;
    float health;
    
    balloon(float x1, float y1, int p, int s, float he){
        x = x1;
        y = y1;
        w = 70;
        h = 80;
        img = loadImage("balloon.png");
        point = p;
        speed = s;
        health = he;
    }
    
    void display() {
        pushMatrix();
        translate(-35, -40);
        fill(0);
        rectMode(CENTER);
        //if (health == 100)tint(0, 153, 204);
        image(img, x, y, w, h);
        //untint!!!!!!!!!!!!!!!!!!!!!!!!!!!
        popMatrix();  
    }
    
    
    
    void setX(float newX){
        x = newX;
    }
    void setY(float newY){
        y = newY;
    }
    float getX(){
        return x;
    }
    float getY(){
        return y;
    }
    
    
    int getPoint(){
        return point;
    }
    void setPoint(int newPoint){
        point = newPoint;
    }
    
    
    int getSpeed(){
        return speed;
    }
}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ balloon ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
//----------------------------------------------------------------------------------------



//----------------------------------------------------------------------------------------
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
class allBalloons {
    ArrayList<balloon> balloons;
    
    
    allBalloons() {
        balloons = new ArrayList<balloon>();
    }
    
    
    void add(float x, float y, int speed, float health){
        balloons.add( new balloon( x , y , 0 , speed, health ) );
    }
    
     
    void remove(int i){
        balloons.remove(i);
    }
    
    
    int size(){
        return balloons.size();
    }
    
    
    balloon get(int i){
        return balloons.get(i);
    }

}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ allBalloons ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
//----------------------------------------------------------------------------------------



//----------------------------------------------------------------------------------------
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
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
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ path ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
//----------------------------------------------------------------------------------------



//----------------------------------------------------------------------------------------
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
class allProjectiles{
    ArrayList<projectile> arrows;
    
    allProjectiles(){
        arrows = new ArrayList<projectile>();
    }
    
    void add(float x, float y , int d){
        arrows.add( new projectile( x , y , d) );
    }
    
     
    void remove(int i){
        arrows.remove(i);
    }
    
    
    int size(){
        return arrows.size();
    }
    
    
    projectile get(int i){
        return arrows.get(i);
    }
    
}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^projectiles^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//----------------------------------------------------------------------------------------



//----------------------------------------------------------------------------------------
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
class projectile{
    float x,y;
    int dmg;
    PImage img;
    
    projectile(float x1, float y1, int d){
        x = x1;
        y = y1;
        dmg = d;
        img = loadImage("arrow.png");
    }
    
    void display() {
        pushMatrix();
        translate(x,y);
        rotate(radians(90));
        fill(0);
        image(img, x, y, 40, 40);
        popMatrix();  
    }
    
    
    void setX(float newX){
        x = newX;
    }
    void setY(float newY){
        y = newY;
    }
    float getX(){
        return x;
    }
    float getY(){
        return y;
    }
    
}

//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ projectile ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
//----------------------------------------------------------------------------------------
