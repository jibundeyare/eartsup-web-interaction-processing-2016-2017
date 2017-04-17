import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;
int[] randomXy = new int[6];

void setup() {
  // environnement en 3D
  size(1000, 800, P3D);

  // initialisation de la caméra
  cam = new PeasyCam(this, 500);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(1000);

  for (int i = 0; i < randomXy.length; i++) {
    randomXy[i] = round(random(0, 100));
  }
}

void draw() {
  background(0);

  for (int i = 0; i < 100; i++) {
    rotateY(1.0 / TWO_PI * i);

    pushMatrix();
    translate(100, 200, -200);
    rotateY(radians(15)); // rotation de 15°
    beginShape(TRIANGLES);
    vertex(randomXy[0], randomXy[1], 0);
    vertex(randomXy[2], randomXy[3], 0);
    vertex(randomXy[4], randomXy[5], 0);
    endShape();
    popMatrix();

    pushMatrix();
    translate(50, 150, -150);
    rotateY(radians(135)); // rotation de 15°
    beginShape(TRIANGLES);
    vertex(30, 75, 0);
    vertex(40, 20, 0);
    vertex(50, 75, 0);
    endShape();
    popMatrix();
  }
}

