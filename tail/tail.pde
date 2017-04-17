PImage img;

int history = 200;
int[] historyX = new int[history];
int[] historyY = new int[history];
int historyIndex = 0;

void setup() {
  size(800, 600);
  blendMode(ADD);
  img = loadImage("data/particle.png");
  imageMode(CENTER);
}

void draw() {
  background(0);

  for (int i = 0; i < history; i++) {
    if (historyX[i]!= 0 && historyY[i] != 0) {
      int offsetHistory;

      if (i >= historyIndex) {
        offsetHistory = i - historyIndex;
      } else {
        offsetHistory = history + (i - historyIndex);
      }

      int alpha = round(map(offsetHistory, 0, history - 1, 0, 255));

      tint(255, alpha);
      image(img, random(-10, 10) + historyX[i], random(-10, 10) + historyY[i], 50, 50);
    }
  }
}

void mousePressed() {
  storePosition();
}

void mouseDragged() {
  storePosition();
}

void storePosition() {
  historyX[historyIndex] = mouseX;
  historyY[historyIndex] = mouseY;

  // println("historyIndex " + historyIndex);
  // println("historyX " + historyX[historyIndex]);
  // println("historyY " + historyY[historyIndex]);

  historyIndex++;

  if (historyIndex >= history) {
    historyIndex = 0;
  }
}

