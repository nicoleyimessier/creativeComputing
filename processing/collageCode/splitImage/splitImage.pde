PImage [] buffer;
PImage img;
PImage women;
int ratio = 3; //the higher the ratio, the smaller the splitImage
int state = 0;

void setup(){
  size(400,400);
  
  buffer = new PImage[ratio * ratio];
  img = loadImage("poms.jpg");
  women = loadImage("78.png");
  image(img, 0, 0, 400, 400);

  
  loadPixels();
  // "g" is a PImage of the applet graphics ;)
  
  buffer = splitImage(women,ratio);
}

void mousePressed(){
  image(buffer[state], mouseX, mouseY);
  state = (state + 1) % buffer.length;
}

void draw(){
}

//This is a function that returns an array of images
PImage [] splitImage(PImage splitMe, int ratio){
  PImage [] buffer = new PImage[ratio * ratio];
  int xStep = splitMe.width / ratio;
  int yStep = splitMe.height / ratio;
  for(int i = 0; i < buffer.length; i++){
    buffer[i] = new PImage(xStep, yStep);
    println((i / (splitMe.height/yStep)) * yStep);
    buffer[i].copy(splitMe, (i * xStep) % splitMe.width, (i / (splitMe.height / yStep)) * yStep, xStep, yStep, 0, 0, buffer[i].width, buffer[i].height);
  }
  return buffer;
}
