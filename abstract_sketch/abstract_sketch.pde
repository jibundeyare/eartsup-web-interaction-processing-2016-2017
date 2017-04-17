void setup() {
  size(1024, 768);
}

void draw() {
  background(255);

  translate(width / 2, height / 2);

  for (float r = 0; r < PI; r += 0.02) {
    rotate(r);

    noStroke();
    fill(0, 50);
    rect(0, 0, 200, 100);
  }
}