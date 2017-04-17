class Particule {
  PVector position = new PVector();
  PVector velocite = new PVector();
  PVector acceleration = new PVector();

  Particule() {
    position.x = random(0, width);
    position.y = random(0, height);
    velocite.x = random(-5, +5);
    velocite.y = random(-5, +5);
    acceleration.x = random(-1, +1);
    acceleration.y = random(-1, +1);
  }

  void update() {
    velocite.add(acceleration);
    velocite.limit(vitesseMax);
    position.add(velocite);
    checkBorders();
  }

  void checkBorders() {
    if (position.x < 0 || position.x > width) {
      acceleration.x = -acceleration.x;
      velocite.x = -velocite.x;
    }

    if (position.y < 0 || position.y > height) {
      acceleration.y = -acceleration.y;
      velocite.y = -velocite.y;
    }
  }
}

