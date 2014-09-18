PImage img;

void setup() {
  size(786, 441);
  img = loadImage("space.jpg");
}

void draw() {

  
    loadPixels(); 
  // Since we are going to access the image's pixels too  
  img.loadPixels(); 
  
  
  for (int x = 1; x < width; x++) {
    for (int y = 0; y < height; y++ ) {
      // Pixel location and color
      int loc = x + y*img.width;
      color pix = img.pixels[loc];

      // Pixel to the left location and color
      int leftLoc = (x-1) + y*img.width;
      color leftPix = img.pixels[leftLoc];

      // New color is difference between pixel and left neighbor
      float diff = abs(brightness(pix) - brightness(leftPix));
      pixels[loc] = color(diff);
    }
  }
  updatePixels();
}
