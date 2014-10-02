//sketch by Nicole Yi Messier 
//nicoleyimessier.com


import gab.opencv.*;
import processing.video.*;

Movie video;
OpenCV opencv;

//----------colors------------------
PImage myImage;
ArrayList colors; 
boolean finished = false;
int position = 0;
int counter = 0;
int colorsLength;

void setup() {
  size(480, 320, P2D);
  background(255);
  video = new Movie(this, "organism1.mov");
  opencv = new OpenCV(this,480, 320);

  opencv.startBackgroundSubtraction(5, 3, 0.5);

  video.loop();
  video.play();

  //myImage=loadImage("philly1.png");
  myImage=loadImage("philly2.png");
  //counter = 0;
  thread("storeColor");
  colors = new ArrayList();
}

void draw() {
  //----------colors------------------
  counter++;
  colorClass c3 = (colorClass) colors.get(int(counter));
  //println("c3.colorImage: " + c3.colorImage);
  fill(c3.colorImage);
 
  if(counter == colorsLength){
   counter=0; 
  };

  //-------video & openCV------------
  //image(video, 0, 0);  
  opencv.loadImage(video);

  opencv.updateBackground();

  opencv.dilate();
  opencv.erode();


  //strokeWeight(3);
  stroke(255);
  for (Contour contour : opencv.findContours()) {
    contour.draw();
  }
}

void movieEvent(Movie m) {
  m.read();
}

// ------------colors--------------
void storeColor() {
  
  if (finished==false) {
    println("start");
    for (int i=0; i<myImage.width; i++) {
      for (int j=0; j<myImage.height; j++) {

        color c = myImage.get(i, j);
        //ellipse(width/2, height/2, 100, 100);
        //println("c: " + c);
        colors.add(new colorClass());
        position++;
        colorClass c2 = (colorClass) colors.get(position-1);
        c2.colorImage = c;
        //colors.add(color2);
        //println("2000: " + colors.get(2000));
      }
    }
    finished = true;
  } else if (finished==true) {
  colorsLength = colors.size();
  println("size: " + colors.size());
  println("finished");
  }
}
