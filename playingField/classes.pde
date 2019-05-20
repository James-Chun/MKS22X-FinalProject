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
  Deque<tile> tiles;
  int[][] field;
  int totalTiles;

  path(float x1, float y1, float x2, float y2, int total) {
    startX = x1;
    startY = y1;
    endX = x2;
    endY = y2;
    totalTiles = total;
    field = new int[height][width];
    tiles = new ArrayDeque<tile>();
    tiles.add(new tile(startX, startY, 20, 20));
    tiles.add(new tile(endX, endY, 20, 20));
    for (int r = 0; r < field.length; r++) {
      for (int c = 0; c < field[0].length; c++) {
        field[r][c] = 0;
      }
    }
  }

  boolean addTile(int x, int y) {
    if (field[x][y] == 0) {
      field[x][y] = 1;
      tiles.addLast(new tile(x, y, 20, 20));
      totalTiles--;
      return true;
    }
    return false;
  }

  boolean removeTile(int x, int y) {
    if (field[x][y] == 1) {
      field[x][y] = 0;
      tiles.removeLast();
      totalTiles++;
      return true;
    }
    return false;
  }

  void display() {
    makePath();
    for (tile t : tiles) {
      t.display();
    }
  }

  void makePath() {
    makePath(startX, endX);
  }

  boolean makePath(float x, float y) {
    int[][] moves = new int[][] {{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
    if (totalTiles == 0 && x == endX && y == endY) {
      return true;
    }
    for (int[] i : moves) {
      if (addTile((int)x, (int) y) && makePath(x + i[0], y + i[1])) {
        return true;
      } else {
        removeTile((int)x, (int) y);
      }
    }
    return false;
  }
}