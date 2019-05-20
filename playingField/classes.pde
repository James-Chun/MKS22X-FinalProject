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
  path(float startX, float startY, float endX, float endY) {
  }
}
