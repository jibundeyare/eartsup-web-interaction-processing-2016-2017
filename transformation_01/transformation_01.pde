void setup () {
  size(600, 400);
  rectMode(CENTER);
}

void draw() {
  background(200);

  rect(0, 0, 200, 150);

  pushMatrix();
  translate(width / 2, height / 2);
  rotate(HALF_PI / 2);
  rect(0, 0, 200, 150);
  popMatrix();

  translate(width, height);
  rect(0, 0, 200, 150);
}

