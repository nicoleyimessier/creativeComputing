//pixel sketching by Nicole Yi Messier
//nicoleyimessier.com

PImage img; 
float cols;
float rows;
float offset;
float denX; 
float denY; 
float rectW=0;


void setup() {
  size(500, 677);
  img=loadImage("philly1.png");
  cols = 10;
  rows = 5;
  offset = 2;
  noSmooth();
  denX = 1;
  denY = 1;
}

void draw() {
  background(0);
  for (int x=0; x < width; x+=1) {
    for (int y=0; y < height; y+= 1) {
      color c = img.get(x, y);
      float bright = brightness(c);
      //println("bright: " + bright);
      rectMode(CENTER);
      float time = millis()*0.001;
      float sine = sin(time);
      float cose = cos(time);
      float sineMap = map(sine, -1, 1, 0.1, 1);

      /*
      //rectangles based on brightess and random value
      noStroke();
      fill(c);
      denX = random(1,10);
      rect(x, y, bright/desnX + sine, bright/denY + sine); 
      */

      //slitscreen variations
      //rect(x, y*offset, 10, 10);
      //rect(x, y, 10*sineMap, 10);
      
      
      //vertical rectangles based on brightness
      stroke(c);
      rectW=1;
      rect(x, y, rectW, bright/sineMap);
      
      //rotating lines
      //fill(c);
    }
  }
  if (keyPressed) {
    if (key == 's') {
      saveFrame();
      println("screenshot captured");
    }
  }
}

