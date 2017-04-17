int raysPerSide = 1;

void setup() {
  size(800, 800);
  smooth();
}

void draw() {
  background(255);

  int cellWidth = width;
  int cellHeight = height;
  int cellX = 0;
  int cellY = 0;
  float centerX = map(mouseX, 0, width, 0, cellWidth);
  float centerY = map(mouseY, 0, height, 0, cellHeight);

  float raysOffsetX = (float) cellWidth / (raysPerSide + 1);
  float raysOffsetY = (float) cellHeight / (raysPerSide + 1);

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

