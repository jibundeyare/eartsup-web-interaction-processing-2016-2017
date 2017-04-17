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
  int x;
  int y;

  img.loadPixels();
  for (y = 0; y < img.height; y++) {
    colors[y] = img.pixels[y * width + mouseX];
  }

  loadPixels();
  for (x = 0; x < width; x++) {
    for (y = 0; y < height; y++) {
      pixels[y * width + x] = colors[y];
    }
  }
  updatePixels();
}

void mouseClicked() {
  saveFrame();
}

