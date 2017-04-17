void setup() {
  size(800, 600);
}

void draw() {
  background(200, 200, 200);

  // pas de bordure
  noStroke();

  // dessiner un rectangle de 200 x 150
  rect(100, 50, 200, 150);

  // couleur de remplissage
  noFill();

  // couleur de la bordure
  stroke(0, 0, 0);

  // épaisseur de la bordure
  strokeWeight(5);

  // dessiner un rectangle de 200 x 150
  rect(300, 50, 200, 150);
}

