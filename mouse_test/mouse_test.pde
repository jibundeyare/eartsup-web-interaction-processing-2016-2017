void setup() {
}

void draw() {
  if (mousePressed) {
    if (mouseButton == LEFT) {
      println("mouseButton LEFT in draw");
    } else if (mouseButton == RIGHT) {
      println("mouseButton RIGHT in draw");
    }
  }
}

void mouseClicked() {
  println("mouseClicked");
}

void mousePressed() {
  println("mousePressed");
}

void mouseReleased() {
  println("mouseReleased");
}

void mouseDragged() {
  println("mouseDragged " + mouseX + ", " + mouseY);
}

void mouseMoved() {
  println("mouseMoved " + mouseX + ", " + mouseY);
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  println("mouseWheel " + e);
}

