class Particule {
  PVector position = new PVector();
  PVector velocite = new PVector();

  Particule() {
    position.x = random(0, width);
    position.y = random(0, height);
    velocite.x = random(-5, +5);
    velocite.y = random(-5, +5);
  }

  void update() {
    position.add(velocite);
    checkBorders();
  }

  void checkBorders() {
    if (position.x < 0 || position.x > width) {
      velocite.x = -velocite.x;
    }

    if (position.y < 0 || position.y > height) {
      velocite.y = -velocite.y;
    }
  }
}

