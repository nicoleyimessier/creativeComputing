float size = 100; 
float rotation = 0;
float rotation1 = 50;
float rotation2 = 100;
float rotation3 = -50;
float rotation4 = -50;
float radius = 250;

void setup() {
  size (1024, 768, P3D);
}

void draw() {
  background(0);
  noStroke();

  //Sets the default ambient light, directional light, 
  //falloff, and specular values.
  lights();

  //move half the width across, half the height down, 
  //and 300 forward
  translate(width/2, height/2, radius);
  pushMatrix();
  rotateY(rotation);
  pushMatrix();
  translate(-100, -50);
  sphere(size);
  popMatrix();
  pushMatrix();
  translate(100, -50);
  sphere(size);
  popMatrix();
  popMatrix();
  rotation = (rotation + (PI/100)) % (2*PI);

  //-----------second pair-------------------
  pushMatrix();
  rotateY(rotation1);
  pushMatrix();
  translate(-100, 100);
  sphere(size);
  popMatrix();
  pushMatrix();
  translate(100, 100);
  sphere(size);
  popMatrix();
  popMatrix();
  rotation1 = (rotation1 + (PI/100)) % (2*PI);

  //-----------third pair-------------------
  pushMatrix();
  rotateY(rotation2);
  pushMatrix();
  translate(-100, 200);
  sphere(size);
  popMatrix();
  pushMatrix();
  translate(100, 200);
  sphere(size);
  popMatrix();
  popMatrix();
  rotation2 = (rotation2 + (PI/100)) % (2*PI);
  
  //-----------third pair-------------------
  pushMatrix();
  rotateY(rotation3);
  pushMatrix();
  translate(-100, -150);
  sphere(size);
  popMatrix();
  pushMatrix();
  translate(100, -150);
  sphere(size);
  popMatrix();
  popMatrix();
  rotation3 = (rotation3 + (PI/100)) % (2*PI);
  
}
