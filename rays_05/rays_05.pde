import processing.pdf.*;

int raysPerSide = 1;
int gridWidth = 10;
int gridHeight = 10;

boolean record;

void setup() {
  size(800, 800);
  smooth();
}

void draw() {
  if (record) {
    println("beginRecord(PDF)");
    beginRecord(PDF, "screenshot-" + getTimestamp() +".pdf");
  }

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

  if (record) {
    println("endRecord()");
    endRecord();
    record = false;
  }
}

void drawCell(float cellWidth, float cellHeight, float cellX, float cellY, float centerX, float centerY) {
  float raysOffsetX = cellWidth / (raysPerSide + 1);
  float raysOffsetY = cellHeight / (raysPerSide + 1);

  stroke(0, 100);

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

   if (keyCode == ENTER || keyCode == RETURN) {
     record = true;
   }
}

void mouseDragged() {
  gridWidth = round(map(mouseX, 0, width, 1, 20));
  gridHeight = round(map(mouseY, 0, height, 1, 20));
}

