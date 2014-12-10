PImage women;
PImage poms;

void setup() {

  size(420, 150);
  women = loadImage("78.png");
  poms = loadImage("poms.jpg");
  image(women, 0, 0, width, height);
  //image(poms, 0, 0, width, height);
  stroke(255);
  noFill();
  // Rectangle shows area being copied
  rect(7, 22, 10, 10);
}

void draw(){
  if(mousePressed){
    copy(poms, 100, 100, 50, 50, mouseX, mouseY, 50, 50); 
 
  } 
}


