PImage img; 
float centerX;
float centerY;
float amplitude;
int counter;

void setup() {
  size(500, 500);
  background(255);
  centerX = width/2;
  centerY = height/2;
  counter = 0;
  //img=loadImage("philly1.png");
  img=loadImage("philly2.png");
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

  //color c = img.get(x, y);
  float time = millis()*0.001;
  amplitude = 200;
  float sine = amplitude*sin(time)+height/2;
  float cose = amplitude*cos(time)+width/2;
  counter++;
  stroke(pixels[counter-1]);
  line(centerX, centerY, sine+random(1,10), cose+random(1,10));
  
  if(counter==pixels.length){
   counter=0; 
  }
}

