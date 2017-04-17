int raysPerSide = 1;
int gridWidth = 10;
int gridHeight = 10;

void setup() {
  size(800, 800);
  smooth();
}

void draw() {
  background(255);

  float cellWidth = (float) width / gridWidth;
  float cellHeight = (float) height / gridHeight;
  float cellX = 0;
  float cellY = 0;
  float centerX = map(mouseX, 0, width, 0, cellWidth);
  float centerY = map(mouseY, 0, height, 0, cellHeight);

  for (int i = 0; i < gridWidth; i++) {
    for (int j = 0; j < gridHeight; j++) {
      cellX = i * cellWidth;
      cellY = j * cellHeight;
      drawCell(cellWidth, cellHeight, cellX, cellY, centerX, centerY);
    }
  }
}

void drawCell(float cellWidth, float cellHeight, float cellX, float cellY, float centerX, float centerY) {
  float raysOffsetX = cellWidth / (raysPerSide + 1);
  float raysOffsetY = cellHeight / (raysPerSide + 1);

  for (int i = 1; i <= raysPerSide; i++) {
    // top
    line(cellX + centerX, cellY + centerY, cellX + i * raysOffsetX, cellY);

    // right
    line(cellX + centerX, cellY + centerY, cellX + cellWidth, cellY + i * raysOffsetY);

    // bottom
    line(cellX + centerX, cellY + centerY, cellX + i * raysOffsetX, cellY + cellHeight);

    // left
    line(cellX + centerX, cellY + centerY, cellX, cellY + i * raysOffsetY);
  }
}

void keyPressed() {
  if (key == '+') {
    raysPerSide++;

    if (raysPerSide > 100) {
      raysPerSide = 100;
    }
  } else if (key == '-') {
    raysPerSide--;

    if (raysPerSide < 1) {
      raysPerSide = 1;
    }
  } else if (key == ' ') {
      raysPerSide = 1;
  }
}

