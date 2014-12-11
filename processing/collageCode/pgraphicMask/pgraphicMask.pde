PImage niceImage;
PImage maskedImage;
PGraphics pg;
int iw, ih;
int dw, dh;

void setup(){
  size(500, 500);
  niceImage = loadImage("kitchen.jpg");
  iw = niceImage.width;
  ih = niceImage.height;
  dw = width - iw;
  dh = height - ih;
  pg = createGraphics(iw, ih);
}

void draw(){
  //background(255);
  
  //----------pgraphic-----------------

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

  // Black circle
  //fill(0);
  //ellipse(mouseX, mouseY, 400, 400);
  
  //---------------------mask----------------
  // Copy the original image (kept as reference)
  maskedImage = niceImage.get();
  // Apply the mask
  maskedImage.mask(pg);
  // Display the result
  
  image(maskedImage, dw/2, dh/2);
}
