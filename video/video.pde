import processing.video.*;

Capture video;

void setup() {
  size(320, 240, P3D);

  video = new Capture(this, 320, 240);
  video.start();
}

void draw() {
  // video.loadPixels();
  // video.width
  // video.height
  // int pos = x + y * video.width;
  // video.pixels[position]

  image(video, 0, 0);
}

void captureEvent(Capture video) {
  video.read();
}

