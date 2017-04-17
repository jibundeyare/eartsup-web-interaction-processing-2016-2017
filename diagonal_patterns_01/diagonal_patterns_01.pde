int gridWidth = 10;
int gridHeight = 10;
int[][] grid;

void setup() {
  initGrid();
}

void draw() {
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

