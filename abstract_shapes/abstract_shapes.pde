float loops = 40;
float steps = 0;

float loops2 = 30;
float steps2 = 0;

float duration = 60 * 30;
float duration2 = 60 * 60 * 2;

void setup() {
  size(1024, 768);

  steps = 1 / loops;
  steps2 = 1 / loops2;
}

void draw() {
  background(255);

  pushMatrix();
  translate(width / 2, height / 2);
  rotate(TWO_PI * 1 / duration * (frameCount % duration));

  for (int i = 0; i < loops; i++) {
    pushMatrix();
    rotate(TWO_PI * steps * i);
    noStroke();
    fill(0, 50);
    rect(10, 0, 200, 100);
    popMatrix();
  }

  popMatrix();

  pushMatrix();
  translate(width / 2, height / 2);
  rotate(TWO_PI * -1 / duration2 * (frameCount % duration2));

  for (int i = 0; i < loops2; i++) {
    pushMatrix();
    rotate(TWO_PI * steps2 * i);
    noStroke();
    fill(0, 50);
    rect(300, 0, 100, 10);
    popMatrix();
  }

  popMatrix();
}

