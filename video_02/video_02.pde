import processing.video.*;

Capture video;

void setup() {
  size(1280, 960, P3D);

  video = new Capture(this, 320, 240);
  video.start();
}

void draw() {
  background(0);
  video.loadPixels();

  int position;
  float red;
  float green;
  float blue;
  float z;
  float size;

  for (int x = 0; x < video.width; x = x + 4) {
    for (int y = 0; y < video.height; y = y + 4) {
      position = x + y * video.width;

      red = red(video.pixels[position]);
      green = green(video.pixels[position]);
      blue = blue(video.pixels[position]);

      z = (red + green + blue) / 3;
      size = map(z, 0, 255, 0, 100);

      noStroke();
      fill(video.pixels[position]);
      ellipse(x * 4, y * 4, size, size);
    }
  }

  //image(video, 0, 0);
}

void captureEvent(Capture video) {
  video.read();
}

