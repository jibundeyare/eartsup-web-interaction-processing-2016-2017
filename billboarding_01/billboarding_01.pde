import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;
int count = 1000;
PVector[] particles = new PVector[count];

void setup() {
  size(1000, 800, P3D);

  cam = new PeasyCam(this, 1000);

  for (int i = 0; i < particles.length; i++) {
    particles[i] = new PVector(random(-1000, 1000), random(-1000, 1000), random(-1000, 1000));
  }
}

void draw() {
  background(0);

  for (int i = 0; i < particles.length; i++) {
    pushMatrix();
    translate(particles[i].x, particles[i].y, particles[i].z);
    noStroke();
    ellipse(0, 0, 50, 50);
    popMatrix();
  }
}

