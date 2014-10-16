//texture midterm @mfadt
//nicoleyimessier.com

float size = 2.0;
float rectX, rectY;
float amplitude;
float startX, startY;
int[] radius = new int[550]; 

//-------------colors-------------
PImage img; 
int counter;


void setup() {
  size(500, 500);
  startX = width/2;
  startY = height/2;
  amplitude = 20;

  for (int i=0; i<550; i++) {
    radius[i] = int(amplitude) + int(random(0, 10));
  }

  //-------------colors-------------
  img=loadImage("space2.png");
  //img=loadImage("space.jpg");
  //img=loadImage("philly2.png");
  //img=loadImage("philly1.png");
}

void draw() {
  //-------------colors-------------
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


  background(0);
  fill(255);
  //stroke(pixels[counter-1]);
  rectMode(CENTER);
  for (float j=amplitude; j<=width; j+=2*amplitude+10) {
    for (float k=amplitude; k<=height; k+=2*amplitude+10) {
      startX = j ;
      startY = k ;
      
      counter++;
      if (counter==pixels.length) {
        counter=0;
      }
      
      stroke(pixels[counter-1]);


      for (float i=0; i<2*PI; i+=0.1) {
        rectX = (amplitude)*cos(i)+startX;
        rectY = (amplitude)*sin(i)+startY;
        //rect(rectX, rectY, radius[int(j)], size);
        rect(rectX, rectY, radius[int(j)], radius[int(j)]);
        println("radius: " + radius[int(j)]);
      }
    }
  }

  //----------save images--------------
  if (keyPressed) {
    if (key == 's') {
      saveFrame();
      println("screenshot captured");
    }
  }
}
