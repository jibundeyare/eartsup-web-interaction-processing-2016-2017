int vitesseMax = 10;
int accelerationMax = 10;
Particule p = new Particule();
int diametre = 20;

void setup() {
	size(800, 600);
	background(255, 255, 255);
}

void draw() {
	noStroke();
	fill(0, 0, 0, 10);
	ellipse(p.position.x, p.position.y, diametre, diametre);
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