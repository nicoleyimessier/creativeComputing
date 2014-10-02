//sketch by Nicole Yi Messier 
//nicoleyimessier.com


import gab.opencv.*;
import processing.video.*;
PImage img;
int counter;
int size=500;

Movie video;
OpenCV opencv;

void setup() {
  size(500, 500, P2D);
  background(255);
  video = new Movie(this, "organism1.mov");
  opencv = new OpenCV(this, 500, 500);
  
  opencv.startBackgroundSubtraction(5, 3, 0.5);
  
  video.loop();
  video.play();
  
  //img=loadImage("philly1.png");
  img=loadImage("philly2.png");
  counter = 0; 
}

void draw() {
  //----------pixels------------------
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
      
      if(g<25.0 && b<25.0 && r<25.0){
       g=r=b=200.0; 
      }
      
      // Set the display pixel to the image pixel
      pixels[loc] =  color(r, g, b);
      
    }
  }
  
  if(counter==pixels.length){
   counter=0; 
  }
  counter++;
  
  //-------video & openCV------------
  //image(video, 0, 0, 500, 500);  
  opencv.loadImage(video);
  
  opencv.updateBackground();
  
  opencv.dilate();
  opencv.erode();

  fill(pixels[counter-1]);
  //strokeWeight(3);
  for (Contour contour : opencv.findContours()) {
    contour.draw();
  }
}

void movieEvent(Movie m) {
  m.read();
}
