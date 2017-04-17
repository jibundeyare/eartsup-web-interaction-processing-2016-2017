int raysPerSide = 1;

void setup() {
  size(800, 800);
  smooth();
}

void draw() {
  background(255);

  float raysOffsetX = (float) width / (raysPerSide + 1);
  float raysOffsetY = (float) height / (raysPerSide + 1);

  for (int i = 1; i <= raysPerSide; i++) {
    // top
    line(mouseX, mouseY, i * raysOffsetX, 0);

    // right
    line(mouseX, mouseY, width, i * raysOffsetY);

    // bottom
    line(mouseX, mouseY, i * raysOffsetX, height);

    // left
    line(mouseX, mouseY, 0, i * raysOffsetY);
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

