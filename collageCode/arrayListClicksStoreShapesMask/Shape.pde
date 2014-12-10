class Shape {
  PShape s;
  int tag; 
  PGraphics pg;
  PImage returnedImage;
  PImage maskedImage;

  void shapeSet() {
    s = createShape();
    s.beginShape();
    s.fill(0, 0, 255);
    s.noStroke();
    //println("shape set!");
  }

  void shapeVertex(int x, int y) {
    s.vertex(x, y);
    //println("shape vertex!");
  }

  void display() {
    s.endShape(CLOSE);
    shape(s);
    //println("shape created!");
  }

  void storeTag(int x) {
    tag = x;
  }

  void pGraphic() {

    //maskedImage = loadImage("poms.jpg");
    maskedImage = loadImage("space2.png");
    iw = maskedImage.width;
    ih = maskedImage.height;
    pg = createGraphics(iw, ih);
      //----------pgraphic-----------------
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
    returnedImage = maskedImage.get();
    // Apply the mask
    returnedImage.mask(pg);
    // Display the result


    image(returnedImage, 0, 0);
    println("masked!");
  }
}

