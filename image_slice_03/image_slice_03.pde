int ratio = 4;

PImage img;
int[] colors;

void settings() {
  img = loadImage("0a_b9g-rm6w-austin-neill.jpg");
  img.resize(round(img.width / ratio), round(img.height / ratio));
  size(img.width, img.height);
}

void setup() {
  colors = new int[img.height];
}

void draw() {

  for (int y = 0; y < img.height; y++) {
    colors[y] = img.get(mouseX, y);
  }

  for (int x = 0; x < width; x++) {
    for (y = 0; y < height; y++) {
      stroke(colors[y]);
      point(x, y);
    }
  }
}

