int strokeWeight0 = 1;
int strokeWeight1 = 1;

int strokeCap0 = ROUND;
int strokeCap1 = ROUND;

int colorBg = color(255);
int color0 = color(0);
int color1 = color(0);

int alpha0 = 255;
int alpha1 = 255;

int gridWidth = 10;
int gridHeight = 10;
int[][] grid;

void setup() {
  size(800, 800);
  initGrid();
}

void draw() {
  float x1, y1, x2, y2;

  background(colorBg);

  for (int gridX = 0; gridX < gridWidth; gridX++) {
    for (int gridY = 0; gridY < gridHeight; gridY++) {
      x1 = gridX * width / gridWidth;
      y1 = gridY * height / gridHeight;

      x2 = x1 + width / gridWidth;
      y2 = y1 + height / gridHeight;

      if (grid[gridX][gridY] == 0) {
        strokeCap(strokeCap0);
        strokeWeight(strokeWeight0);
        stroke(color0, alpha0);
        line(x1, y1, x2, y2);
      } else {
        strokeCap(strokeCap1);
        strokeWeight(strokeWeight1);
        stroke(color1, alpha1);
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
  // new
  if (key == ' ') {
    initGrid();
  }

  // cap line 0
  if (key == 'a') {
    strokeCap0 = ROUND;
  } else if (key == 'z') {
    strokeCap0 = SQUARE;
  } else if (key == 'e') {
    strokeCap0 = PROJECT;
  }

  // cap line 1
  if (key == 'q') {
    strokeCap1 = ROUND;
  } else if (key == 's') {
    strokeCap1 = SQUARE;
  } else if (key == 'd') {
    strokeCap1 = PROJECT;
  }

  // color background
  if (key == '1') {
    colorBg = color(255);
  } else if (key == '2') {
    colorBg = color(242, 228, 186);
  }

  // color line 0
  if (key == 'u') {
    color0 = color(0);
  } else if (key == 'i') {
    color0 = color(242, 87, 144);
  }

  // color line 1
  if (key == 'j') {
    color1 = color(0);
  } else if (key == 'k') {
    color1 = color(29, 110, 128);
  }

  // alpha line 0
  if (key == 'o') {
    alpha0 = 255;
  } else if (key == 'p') {
    alpha0 = 100;
  }

  // alpha line 1
  if (key == 'l') {
    alpha1 = 255;
  } else if (key == 'm') {
    alpha1 = 100;
  }
}

void mouseMoved() {
  strokeWeight0 = round(map(mouseX, 0, width, 1, width / gridWidth * 1.5));
  strokeWeight1 = round(map(mouseY, 0, height, 1, height / gridHeight * 1.5));
}

