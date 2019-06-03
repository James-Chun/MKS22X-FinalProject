import java.util.*;


//For all classes: x - x-coord, y - y-coord, w - width of image, h - height of image.


//----------------------------------------------------------------------------------------
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
class monkey {
  int[][] allPoints;
  float x, y, w, h;
  PImage img;
  float rangeRadius;

  monkey(float xPos, float yPos, float wid, float hei, path p, float range) {
    x = xPos;
    y = yPos;
    w = wid;
    h = hei;
    allPoints = p.getRandPoints();
    img = loadImage("monkey.png");
    rangeRadius = range;
  }

  float getX() {
    return x;
  }
  float getY() {
    return y;
  }

  void display() {
    pushMatrix();
    translate(w/2 * -1, h/2 * -1);
    fill(255);
    image(img, x, y, w, h);
    popMatrix();
  }

  void display(float x1, float y1) {
    pushMatrix();
    translate(w/2 * -1, h/2 * -1);
    fill(255);
    image(img, x1, y1, w, h);
    popMatrix();
  }

  void rangeDisplay(float x1, float y1) {
    strokeWeight(0);
    fill(200, 10);
    ellipse(x1, y1, rangeRadius, rangeRadius);
  }

  void attack(ArrayList<balloon> balloons) {
    for (int i = 0; i < balloons.size(); i++) {
      if (dist(balloons.get(i).getX(), balloons.get(i).getY(), x, y) <= rangeRadius / 2) {
        balloons.get(i).takeDamage(1);
      }
    }
  }
}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ monkey ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
//----------------------------------------------------------------------------------------



//----------------------------------------------------------------------------------------
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
class balloon {
  float x, y, w, h;
  PImage img;
  int point; //keeping track of which point the balloon is heading towards
  int speed;
  int health;

  balloon(float x1, float y1, int p, int s, int he) {
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



  void setX(float newX) {
    x = newX;
  }
  void setY(float newY) {
    y = newY;
  }
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }


  int getPoint() {
    return point;
  }
  void setPoint(int newPoint) {
    point = newPoint;
  }


  int getSpeed() {
    return speed;
  }

  void takeDamage(int dmg) {
    health -= dmg;
  }
  int getHealth() {
    return health;
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


  void add(float x, float y, int speed, int health) {
    balloons.add( new balloon( x, y, 0, speed, health ) );
  }


  void remove(int i) {
    balloons.remove(i);
  }


  int size() {
    return balloons.size();
  }


  balloon get(int i) {
    return balloons.get(i);
  }

  ArrayList<balloon> getAllBalloons() {
    return balloons;
  }
}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ allBalloons ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
//----------------------------------------------------------------------------------------



//----------------------------------------------------------------------------------------
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
class path {
  int[][] randPoints;
  PImage path;

  path(int totalPoints) {//creating path with specified number of points
    randPoints = new int[totalPoints][2];
    makePath();
    path = loadImage("path.png");
  }

  void display() {
    for (int i = 1; i < randPoints.length; i++) {
      strokeWeight(20);            
      pushMatrix();
      if (randPoints[i-1][1] > randPoints[i][1]) {
        translate(randPoints[i-1][0], randPoints[i-1][1]);
        rotate(PI + asin( -(randPoints[i-1][0] - randPoints[i][0]) / sqrt((randPoints[i-1][0]-randPoints[i][0])*(randPoints[i-1][0]-randPoints[i][0]) + (randPoints[i-1][1]-randPoints[i][1])*(randPoints[i-1][1]-randPoints[i][1]) ) ) );
      } else {
        translate(randPoints[i-1][0], randPoints[i-1][1]);
        rotate( asin( (randPoints[i-1][0] - randPoints[i][0]) / sqrt((randPoints[i-1][0]-randPoints[i][0])*(randPoints[i-1][0]-randPoints[i][0]) + (randPoints[i-1][1]-randPoints[i][1])*(randPoints[i-1][1]-randPoints[i][1]) ) ) );
      }
      image(path, -20, -10, 40, 20 + sqrt((randPoints[i-1][0]-randPoints[i][0])*(randPoints[i-1][0]-randPoints[i][0]) + (randPoints[i-1][1]-randPoints[i][1])*(randPoints[i-1][1]-randPoints[i][1]) ));
      popMatrix();
    }
  }
  void makePath() {
    int spacing = (int) width / randPoints.length;
    for (int r = 0; r < randPoints.length; r++) {
      if (r == 0) {
        randPoints[r][0] = 0;
      } else if (r == randPoints.length -1) {
        randPoints[r][0] = width;
      } else {
        randPoints[r][0] = (int) random(spacing * r, spacing * (r+1));
      }
    }
    for (int r = 0; r < randPoints.length; r++) {
      randPoints[r][1] = (int) random(height);
    }
  }

  int[] getStart() {
    return randPoints[0];
  }

  int[] getEnd() {
    return randPoints[randPoints.length-1];
  }

  int[] getNextPoint(int index) {
    return randPoints[index+1];
  }
  int[] getPoint(int index) {
    return randPoints[index];
  }
  boolean hasNextPoint(int index) {
    return index<=randPoints.length-2;
  }

  int[][] getRandPoints() {
    return randPoints;
  }
}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ path ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
//----------------------------------------------------------------------------------------



//----------------------------------------------------------------------------------------
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
class allProjectiles {
  ArrayList<projectile> arrows;

  allProjectiles() {
    arrows = new ArrayList<projectile>();
  }

  void add(float x, float y, int d) {
    arrows.add( new projectile( x, y, d) );
  }


  void remove(int i) {
    arrows.remove(i);
  }


  int size() {
    return arrows.size();
  }


  projectile get(int i) {
    return arrows.get(i);
  }
}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^projectiles^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//----------------------------------------------------------------------------------------



//----------------------------------------------------------------------------------------
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
class projectile {
  float x, y;
  int dmg;
  PImage img;

  projectile(float x1, float y1, int d) {
    x = x1;
    y = y1;
    dmg = d;
    img = loadImage("arrow.png");
  }

  void display(float c, float b) {
    pushMatrix();
    fill(0);
    translate(-15, -15);
    image(img, x, y, 30, 30);
    popMatrix();
  }



  void setX(float newX) {
    x = newX;
  }
  void setY(float newY) {
    y = newY;
  }
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }

  int getDamage() {
    return dmg;
  }
}

//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ projectile ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
//----------------------------------------------------------------------------------------
