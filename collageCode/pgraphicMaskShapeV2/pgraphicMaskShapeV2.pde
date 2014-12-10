PImage niceImage;
PImage maskedImage;
PGraphics pg;
//store height and width of image
int iw, ih;
int dw, dh;


//------------shape--------------
PShape s;  // The PShape object
int points = 4;
int [] savedX = new int[points];
int [] savedY = new int[points];
int counter=0;
PImage kitchen;

void setup() {
  size(500, 500);
  niceImage = loadImage("poms.jpg");
  iw = niceImage.width;
  ih = niceImage.height;
  dw = width - iw;
  dh = height - ih;
  pg = createGraphics(iw, ih);

  //------------shape--------------
  kitchen = loadImage("kitchen1.png");
  image(kitchen, 0, 0, 640, 513);
  // Creating a custom PShape as a square, by
  // specifying a series of vertices.
}

void draw() {
  //background(255);




  pg.beginDraw();
  // Erase graphics with black background
  pg.background(0);
  // Draw the mask, depending on mouse position
  int x = mouseX - dw/2;
  int y = mouseY - dh/2;
  // Draw in white
  pg.fill(255);
  pg.noStroke();
  // An ellipse to see a good part of the image
  pg.ellipse(x, y, 100, 100);
  pg.endDraw();


  //---------------------mask----------------
  // Copy the original image (kept as reference)
  maskedImage = niceImage.get();
  // Apply the mask
  maskedImage.mask(pg);
  // Display the result

  if (mousePressed) {
    image(maskedImage, dw/2, dh/2);
  }
}


