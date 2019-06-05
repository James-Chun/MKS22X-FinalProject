import java.util.*;

class monkey {
  int[][] allPoints;
  float x, y, w, h;
  PImage img;
  float rangeDiameter;
  boolean isAttacking;
  int hasten;

  monkey(float xPos, float yPos, float wid, float hei, path p, float range) {
    x = xPos;
    y = yPos;
    w = wid;
    h = hei;
    allPoints = p.getRandPoints();
    img = loadImage("dartMonkey.png");
    rangeDiameter = range;
    isAttacking = false;
    hasten = 1;
  }

  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
  
  void setHasten(int h) {
    hasten = h;
  }

  void display() {
    pushMatrix();
    translate(w/2 * -1, h/2 * -1);
    tint(255);
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

  void rangeDisplay(float x1, float y1, String c) {
    strokeWeight(0);
    if (c.equals("red")) {
      fill(255,0,0,100);
    } else {
      fill(20, 60);
    }
    ellipse(x1, y1, rangeDiameter, rangeDiameter);
  }

  void attack(ArrayList<balloon> balloons) {
    if (frameCount % (40 / hasten) == 0) {
      for (int i = 0; i < balloons.size(); i++) {
        if (!isAttacking && dist(balloons.get(i).getX(), balloons.get(i).getY(), x, y) <= rangeDiameter / 2) {
          if (balloons.get(i).getIsTargeted() == false) {
            arrows.add(x, y, 1, balloons.get(i), this);
            balloons.get(i).changeIsTargeted();
            changeIsAttacking();
          }
        }
      }
    }
  }
  
  void changeIsAttacking() {
    isAttacking = !isAttacking;
  }
}

class allProjectiles {
  ArrayList<projectile> arrows;

  allProjectiles() {
    arrows = new ArrayList<projectile>();
  }

  void add(float x, float y, int d, balloon b, monkey m) {
    arrows.add(new projectile(x, y, d, b, m));
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
  monkey owner;

  projectile(float x1, float y1, int d, balloon target, monkey m) {
    x = x1;
    y = y1;
    dmg = d;
    img = loadImage("arrow.png");
    b = target;
    owner = m;
  }

  void display() {
    pushMatrix();
    tint(255);
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
    owner.changeIsAttacking();
    money++;
    arrows.remove(this);
  }
}
