int ratio = 4;

PImage img;

void settings() {
  img = loadImage("0a_b9g-rm6w-austin-neill.jpg");
  img.resize(round(img.width / ratio), round(img.height / ratio));
  size(img.width, img.height);
}

void setup() {
}

void draw() {
  image(img, 0, 0);
}

