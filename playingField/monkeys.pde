import java.util.*;

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
    if (frameCount % 40 == 0) {
      for (int i = 0; i < balloons.size(); i++) {
        if (dist(balloons.get(i).getX(), balloons.get(i).getY(), x, y) <= rangeRadius) {
          if (balloons.get(i).getIsTargeted() == false) {
            arrows.add(x, y, 1, balloons.get(i));
            balloons.get(i).changeIsTargeted();
          }
        }
      }
    }
  }
}

class allProjectiles {
  ArrayList<projectile> arrows;

  allProjectiles() {
    arrows = new ArrayList<projectile>();
  }

  void add(float x, float y, int d, balloon b) {
    arrows.add(new projectile(x, y, d, b));
  }


  void remove(projectile p) {
    arrows.remove(p);
  }


  int size() {
    return arrows.size();
  }


  projectile get(int i) {
    return arrows.get(i);
  }
}

class projectile {
  float x, y;
  int dmg;
  PImage img;
  balloon b;

  projectile(float x1, float y1, int d, balloon target) {
    x = x1;
    y = y1;
    dmg = d;
    img = loadImage("arrow.png");
    b = target;
  }

  void display() {
    pushMatrix();
    fill(0);
    translate(-15, -15);
    image(img, x, y, 30, 30);
    popMatrix();
  }
  //void setX(float newX) {
  //  x = newX;
  //}
  //void setY(float newY) {
  //  y = newY;
  //}
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }

  int getDamage() {
    return dmg;
  }

  void moveTo() {
    while ((Math.abs(x - b.getX()) >= 10 && Math.abs(y - b.getY()) >= 10)) {
      if (frameCount % 1 == 0) {
        this.display();
        x = x + (30 * (b.getX() - x)) / (dist(x, y, b.getX(), b.getY()));
        y = y + (30 * (b.getY() - y)) / (dist(x, y, b.getX(), b.getY()));
      }
    }
    b.takeDamage(dmg);
    b.changeIsTargeted();
    arrows.remove(this);
  }
}
