int vitesseMax = 10;
int accelerationMax = 10;
Particule p = new Particule();
int diametre = 20;

int lignes = 100;
int colonnes = 100;
PVector[][] grille = new PVector[colonnes][lignes];

int largeurCellule;
int hauteurCellule;

void setup() {
  size(800, 600);

  largeurCellule = width / colonnes;
  hauteurCellule = height / lignes;

  background(255, 255, 255);

  float theta;

  for (int x = 0; x < colonnes; x++) {
    for (int y = 0; y < lignes; y++) {
      theta = noise(x, y) * TWO_PI;
      grille[x][y] = PVector.fromAngle(theta);
    }
  }
}

void draw() {
  noStroke();
  fill(0, 0, 0, 10);
  ellipse(p.position.x, p.position.y, diametre, diametre);

  int haut;
  int bas;
  int gauche;
  int droite;

  for (int x = 0; x < colonnes; x++) {
    for (int y = 0; y < lignes; y++) {
      gauche = x * largeurCellule;
      droite = x * largeurCellule + largeurCellule;

      haut = y * hauteurCellule;
      bas = y * hauteurCellule + hauteurCellule;

      if (p.position.x >= gauche
        && p.position.x < droite
        && p.position.y >= haut
        && p.position.y < bas) {
        p.acceleration = grille[x][y];
      }
    }
  }

  p.update();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      p.acceleration.add(new PVector(0, -1));
      p.acceleration.limit(accelerationMax);
    }

    if (keyCode == DOWN) {
      p.acceleration.add(new PVector(0, 1));
      p.acceleration.limit(accelerationMax);
    }

    if (keyCode == LEFT) {
      p.acceleration.add(new PVector(-1, 0));
      p.acceleration.limit(accelerationMax);
    }

    if (keyCode == RIGHT) {
      p.acceleration.add(new PVector(1, 0));
      p.acceleration.limit(accelerationMax);
    }
  }
}

