/*
HALF_PI : 1/4 de tour
PI : 1/2 de tour
TWO_PI : 1 tour complet
steps * i : à combiner avec une autre valeur
*/
int loops = 100;
float steps;
float zoom = 1;
float rotation = 0;

void setup () {
  size(600, 400);
  steps = 1 / (float) loops;
}

void draw() {
  background(255);
  translate(width / 2, height / 2);
  rotation = rotation + 0.01;
  zoom = zoom + 0.001;
  scale(zoom);

  for (int i = 0; i < loops; i++) {
    pushMatrix();
    rotate(PI * steps * i + rotation);
    noStroke();
    // varier le composant rouge de 0 à 255
    // fill(round(255 * steps * i), 255, 100, 20);

    // varier le composant rouge de 255 à 0
    // fill(255 - round(255 * steps * i), 255, 100, 20);

    // varier le composant rouge de 100 à 200
    fill(100 + round(100 * steps * i), 255, 100, 20);

    // varier le composant rouge de 200 à 100
    fill(200 - round(100 * steps * i), 255, 100, 20);

    rect(100, 0, 100, 50);
    popMatrix();
  }
}

