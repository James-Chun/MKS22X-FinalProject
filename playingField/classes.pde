import java.util.*;

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

class balloons {
  
  ArrayList<balloon> balloons;
  
  class balloon{
    
    float x, y, w, h;
    
    balloon(){
      
    }
    
    void display() {
      fill(0);
      rectMode(CENTER);
      rect(x, y, w, h);
    }
    
  }
   
  balloons() {
  }
  
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