Particule p = new Particule();

void setup() {
  size(1024, 768);
  background(100, 200, 0);
}

void draw() {
  ellipse(p.position.x, p.position.y, 50, 50);
  p.update();
}

