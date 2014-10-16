float centerX;
float centerY;
float amplitude = 5;

void setup() {
  background(255);
  size(500,500);
  centerX = width/2;
  centerY = height/2;
}

void draw() {
  
  float time = millis()*0.001;
  amplitude += 10;
  float sine = amplitude*sin(time)+height/2;
  float cose = amplitude*cos(time)+width/2;
  
  line(centerX, centerY, sine+random(1,10), cose+random(1,10));

  if (keyPressed) {
    if (key == 's') {
      saveFrame();
      println("screenshot captured");
    }
  }
}
