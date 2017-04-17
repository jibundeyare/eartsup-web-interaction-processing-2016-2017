import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import processing.video.*;

PeasyCam cam;
Capture video;

void setup() {
  size(1000, 800, P3D);

  cam = new PeasyCam(this, 500);

  video = new Capture(this, 320, 240);
  video.start();
}

void draw() {
  background(255);
  video.loadPixels();

  // video.width
  // video.height
  // video.pixels[]
  // int position = x + y * video.width;

  int position;
  float red;
  float green;
  float blue;
  float z;

  for (int x = 0; x < video.width; x++) {
    for (int y = 0; y < video.height; y++) {
      position = x + y * video.width;
      
      red = red(video.pixels[position]);
      green = green(video.pixels[position]);
      blue = blue(video.pixels[position]);
      
      z = (red + green + blue) / 3;

      stroke(video.pixels[position]);
      point(x, y, z * -20);
    }
  }

  //image(video, 0, 0);
}

void captureEvent(Capture video) {
  video.read();
}

