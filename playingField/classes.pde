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

class balloon {
  balloon() {
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
  }
  
  void display() {
    for (tile t : tiles) {
      t.display();
    }
  }
}
