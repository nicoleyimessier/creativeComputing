PImage niceImage;
PImage maskedImage;
PGraphics pg;
//store height and width of image
int iw, ih;


//------------shape--------------
PShape s;  // The PShape object
int points = 4;
int [] savedX = new int[points];
int [] savedY = new int[points];
int counter=0;
PImage kitchen;

void setup() {
  size(500, 500, P2D);
  niceImage = loadImage("poms.jpg");
  iw = niceImage.width;
  ih = niceImage.height;
  pg = createGraphics(iw, ih);

  //------------shape--------------
  kitchen = loadImage("kitchen1.png");
  image(kitchen, 0, 0, 640, 513);
  // Creating a custom PShape as a square, by
  // specifying a series of vertices.
  s = createShape();
}

void draw() {
  //background(255);

  //------------shape--------------
  if (counter==points) {
    s.beginShape();
    //s.fill(0, 0, 255);
    s.noStroke();

    for (int i=0; i<points; i++) {
      s.vertex(savedX[i], savedY[i]);

      //println(i + ": " + savedX[i] + ", " + savedY[i]);
    }

    s.endShape(CLOSE);
  }

  //----------pgraphic-----------------
  if (counter==points) {
    pg.beginDraw();
    // Erase graphics with black background
    pg.background(0);
    // Draw in white
    pg.fill(255);
    pg.noStroke();
    // An ellipse to see a good part of the image
    pg.shape(s);
    pg.endDraw();


    //---------------------mask----------------
    // Copy the original image (kept as reference)
    maskedImage = niceImage.get();
    // Apply the mask
    maskedImage.mask(pg);
    // Display the result
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

  if (key == 'b') {
    image(maskedImage, 0, 0);
    println("masked!");
  }
}

