

PImage img; 
float centerX;
float centerY;
float amplitude;

void setup() {
  size(500, 500);
  centerX = width/2;
  centerY = height/2;
  img=loadImage("philly1.png");
}

void draw() {

      //color c = img.get(x, y);
      float time = millis()*0.001;
      amplitude = 200;
      float sine = amplitude*sin(time)+height/2;
      float cose = amplitude*cos(time)+width/2;
      //stroke(c);
      
      line(centerX, centerY, sine, cose);
    
  
}


