//texture midterm @mfadt
//nicoleyimessier.com

float size = 2.0;
float rectX, rectY;
float amplitude;
float startX, startY;
int[] radius = new int[500]; 

void setup() {
  size(500, 500);
  startX = width/2;
  startY = height/2;
  amplitude = 20;
  
  for (int i=0; i<500; i++) {
    radius[i] = int(amplitude) + int(random(0,10));
  }
}

void draw() {
  background(0);
  fill(255);

  //amplitude = 100;
  //float cose = amplitude*cos(theta)+startX;
  //float sine = amplitude*sin(theta)+startY;
  rectMode(CENTER);

  for (float j=amplitude; j<=width; j+=2*amplitude+10) {
    for (float k=amplitude; k<=height; k+=2*amplitude+10) {
      startX = j ;
      startY = k ;
      for (float i=0; i<2*PI; i+=0.1) {
        rectX = (radius[int(j)])*cos(i)+startX;
        rectY = (radius[int(k)])*sin(i)+startY;
        //rect(rectX, rectY, radius[int(j)], size);
        rect(rectX, rectY, size, size);
        println("j: " + j);
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
