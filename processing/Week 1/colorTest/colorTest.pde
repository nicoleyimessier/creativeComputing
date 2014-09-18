PImage myImage;

void setup() {
  myImage = loadImage("pic.png");
}

void draw() {
  //image(myImage, 0, 0);
  color c = myImage.get(25, 25);
  println("c: " + c);
  fill(c);
  noStroke();
  rect(25, 25, 50, 50);
}

void storeColor() {
}

