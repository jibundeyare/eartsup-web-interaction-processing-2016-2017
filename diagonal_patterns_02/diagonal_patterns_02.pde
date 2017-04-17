int gridWidth = 10;
int gridHeight = 10;
int[][] grid;

void setup() {
  size(800, 800);
  initGrid();
}

void draw() {
  float x1, y1, x2, y2;

  background(255);

  for (int gridX = 0; gridX < gridWidth; gridX++) {
    for (int gridY = 0; gridY < gridHeight; gridY++) {
      x1 = gridX * width / gridWidth;
      y1 = gridY * height / gridHeight;

      x2 = x1 + width / gridWidth;
      y2 = y1 + height / gridHeight;

      if (grid[gridX][gridY] == 0) {
        line(x1, y1, x2, y2);
      } else {
        line(x1, y2, x2, y1);
      }
    }
  }
}

void initGrid() {
  int orientation;

  grid = new int[gridWidth][gridHeight];

  for (int gridX = 0; gridX < gridWidth; gridX++) {
    for (int gridY = 0; gridY < gridHeight; gridY++) {
      orientation = int(random(0, 2));
      grid[gridX][gridY] = orientation;
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    initGrid();
  }
}

