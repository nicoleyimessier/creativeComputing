PShape s;  // The PShape object
int points = 4;
int [] savedX = new int[points];
int [] savedY = new int[points];
int counter=0;
PImage kitchen;

void setup() {
  size(500, 500, P2D);
  kitchen = loadImage("kitchen1.png");
  image(kitchen, 0, 0, 640, 513);
  // Creating a custom PShape as a square, by
  // specifying a series of vertices.
  s = createShape();
}

void draw() {

  if (counter==points) {
    s.beginShape();
    s.fill(0, 0, 255);
    s.noStroke();

    for (int i=0; i<points; i++) {
      s.vertex(savedX[i], savedY[i]);

      //println(i + ": " + savedX[i] + ", " + savedY[i]);
    }

    s.endShape(CLOSE);
  }
}

void mousePressed() {
  savedX[counter]=mouseX;
  savedY[counter]=mouseY;
  for (int i=0; i<points; i++) {
    //println("x, y, i: " + i + ", " + savedY[i] + ", " + savedX[i]);
  }
  counter++;
  println("counter: " + counter);
}

void keyPressed() {
  if (key == 's') {
    shape(s);
    println("Shape created!");
  }
}

