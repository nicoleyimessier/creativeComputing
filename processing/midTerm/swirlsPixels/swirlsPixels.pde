float centerX;
float centerY;
float amplitude = 5;
PImage img; 
int counter;

void setup() {
  background(255);
  size(1440, 1440);
  centerX = width/2;
  centerY = height/2;
  counter = 0;
  //img=loadImage("philly1.png");
  //img=loadImage("philly2.png");
  img=loadImage("space2.png");
}

void draw() {

  loadPixels(); 
  img.loadPixels(); 
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;

      // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);

      // Image Processing would go here
      // If we were to change the RGB values, we would do it here, before setting the pixel in the display window.

      // Set the display pixel to the image pixel
      pixels[loc] =  color(r, g, b);
    }
  }
  counter++;
  stroke(pixels[counter-1]);
  float time = millis()*0.001;
  amplitude += 10;
  float sine = amplitude*sin(time)+height/2;
  float cose = amplitude*cos(time)+width/2;

  line(centerX, centerY, sine+random(1, 10), cose+random(1, 10));

  if (keyPressed) {
    if (key == 's') {
      saveFrame();
      println("screenshot captured");
    }
  }
}
