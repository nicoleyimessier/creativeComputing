//pixel sketching by Nicole Yi Messier
//nicoleyimessier.com

PImage img;

void setup() {
  size(150, 200);
  img = loadImage("philly1.png");
}

void draw() {
  //image(img, 0, 0, 450, 600);

  loadPixels(); 
  // Since we are going to access the image's pixels too  
  img.loadPixels(); 

  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      // Calculate the 1D pixel location
      int loc = x + y*img.width;
      // Get the R,G,B values from image
      float r = red   (img.pixels[loc]);
      float g = green (img.pixels[loc]);
      float b = blue  (img.pixels[loc]);
      // Change brightness according to the mouse here
      float adjustBrightness = ((float) mouseX / width) * 8.0;
      //println("adjustBrightness: " + adjustBrightness);
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;
      // Constrain RGB to between 0-255
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);
      // Make a new color and set pixel in the window
      color c = color(r, g, b);
      pixels[loc] = c;
    }
  }
  updatePixels();
}
