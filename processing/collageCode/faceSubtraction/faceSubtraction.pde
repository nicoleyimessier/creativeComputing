import gab.opencv.*;
import java.awt.Rectangle;

OpenCV opencv;
Rectangle[] faces;

void setup() {
  //opencv = new OpenCV(this, "IBM.jpg");
  opencv = new OpenCV(this, "78.png");
  size(opencv.width, opencv.height);

  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  faces = opencv.detect();
 
}

void draw() {
  image(opencv.getInput(), 0, 0);
  noStroke();
  fill(255, 255, 255);
  for (int i = 0; i < faces.length; i++) {
    
    println("faces[i]: " + faces[i]);
    println("faces.length" + faces.length);
    ellipse(faces[i].x + faces[i].width/2, faces[i].y + faces[i].height/2, faces[i].width, faces[i].height);
  }

}

