import java.util.*;

class balloon {
  float x, y, w, h;
  PImage img;
  int point; //keeping track of which point the balloon is heading towards
  int speed;
  int health;
  boolean isTargeted;

  balloon(float x1, float y1, int p, int s, int he) {
    x = x1;
    y = y1;
    w = 70;
    h = 80;
    img = loadImage("whiteBalloon.png");
    point = p;
    speed = s;
    health = he;
    isTargeted = false;
  }

  void display() {
    pushMatrix();
    translate(-35, -40);
    fill(0,255,0);
    if (health == 5)tint(255, 102, 178);
    if (health == 4)tint(255, 255, 0);
    if (health == 3)tint(0, 255, 0);
    if (health == 2)tint(0, 0, 255);
    if (health == 1)tint(255, 0, 0);
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
    speed--;
  }
  int getHealth() {
    return health;
  }
  void move() {
    //println(point);
    if (second() % 1 == 0 && p.hasNextPoint(point)) {
      float nextX = p.getNextPoint(point)[0];
      float nextY = p.getNextPoint(point)[1];
      x = x + (speed * (nextX - x)) / (dist(x, y, nextX, nextY));
      y = y + (speed * (nextY - y)) / (dist(x, y, nextX, nextY));
      if (x >= nextX) {
        point++;
      }
    } else if (!p.hasNextPoint(point)) {
      balloons.remove(this);
    }
  }

  void changeIsTargeted() {
    isTargeted = !isTargeted;
  }

  boolean getIsTargeted() {
    return isTargeted;
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
    balloons.add(new balloon(x, y, 0, speed, health));
  }


  void remove(int i) {
    balloons.remove(i);
  }

  void remove(balloon b) {
    balloons.remove(b);
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
