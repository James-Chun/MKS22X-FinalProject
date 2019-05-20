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

  void display() {
    fill(255);
    ellipse(x, y, w, h);
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
      img = loadImage("redBalloon.jpg");
    }
    
    void display() {
      fill(0);
      rectMode(CENTER);
      image(img, x, y, w, h);
    }
    
  }//balloon end
   
  allBalloons(float x2, float y2) {
    balloons = new ArrayList<balloon>();
    balloons.add(new balloon(x2, y2, 10, 10));
  }
  
  float x, y;
  
  void display() {
    for (balloon b : balloons) {
      b.display();
    }
  }
}




class path {
  class tile {
    float x, y, w, h;
    tile(float x1, float y1, float wid, float hei) {
      x = x1;
      y = y1;
      w = wid;
      h = hei;
    }

    void display() {
      fill(0);
      rectMode(CENTER);
      rect(x, y, w, h);
    }
  }

  float startX, startY, endX, endY;
  ArrayList<tile> tiles;

  path(float x1, float y1, float x2, float y2) {
    startX = x1;
    startY = y1;
    endX = x2;
    endY = y2;
    tiles = new ArrayList<tile>();
    tiles.add(new tile(startX, startY, 20, 20));
    tiles.add(new tile(endX, endY, 20, 20));
  }

  void display() {
    for (tile t : tiles) {
      t.display();
    }
  }
}