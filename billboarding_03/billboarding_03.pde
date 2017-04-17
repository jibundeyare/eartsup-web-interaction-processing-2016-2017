import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;
int count = 1000;
PVector[] particles = new PVector[count];
PImage img;

void setup() {
  size(1000, 800, P3D);

  blendMode(ADD);
  hint(DISABLE_DEPTH_TEST);

  cam = new PeasyCam(this, 1000);

  for (int i = 0; i < particles.length; i++) {
    particles[i] = new PVector(random(-1000, 1000), random(-1000, 1000), random(-1000, 1000));
  }

  img = loadImage("particle-red.png");
}

void draw() {
  background(0);

  for (int i = 0; i < particles.length; i++) {
    beginBillboard(particles[i].x, particles[i].y, particles[i].z);
    image(img, 0, 0);
    endBillboard();
  }
}

void beginBillboard(float x, float y, float z) {
  pushMatrix();
  translate(x, y, z);

  PMatrix3D m = (PMatrix3D) getMatrix();

  m.m00 = 1.0;
  m.m11 = 1.0;
  m.m22 = 1.0;

  m.m01 = 0.0;
  m.m02 = 0.0;
  m.m10 = 0.0;
  m.m12 = 0.0;
  m.m20 = 0.0;
  m.m21 = 0.0;

  resetMatrix();
  applyMatrix(m);
}

void endBillboard() {
  popMatrix();
}

