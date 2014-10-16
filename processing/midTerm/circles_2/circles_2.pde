//texture midterm @mfadt
//nicoleyimessier.com

float size = 2.0;
float rectX, rectY;
float amplitude;
float startX, startY;
float growth;
boolean growState = true;
boolean shrinkState;

void setup() {
  size(500, 500);
  startX = width/2;
  startY = height/2;
  amplitude = 0;
  frameRate(10);
}

void draw() {
  background(0);
  fill(255);

  //amplitude = 100;
  //float cose = amplitude*cos(theta)+startX;
  //float sine = amplitude*sin(theta)+startY;
  rectMode(CENTER);
  println("amplitude: " + amplitude);

  if (amplitude > width/2) {
    growState = false;
    println("true");
  } 

  if (growState== true) {
    amplitude += 5;
    println("growing");
  } else  {
    amplitude -= 5;
    println("not growing");
  }
  
  println("growState: " + growState);

  for (float i=0; i<2*PI; i+=0.1) {
    growth = random(10, 20); 
    rectX = (amplitude+growth)*cos(i)+startX;
    rectY = (amplitude+growth)*sin(i)+startY;
    rect(rectX, rectY, size, size);
  }

  //----------save images--------------
  if (keyPressed) {
    if (key == 's') {
      saveFrame();
      println("screenshot captured");
    }
  }
}
