//----------------------------------------------------
// written by Nicole Messier
//----------------------------------------------------

// ------------sound--------------
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput mic;
FFT fft;
String windowName;

// ------------rotation with mouse click--------------
float rotX = 0.0, rotY = 0.0;
int lastX, lastY;
float distX = 0.0, distY = 0.0;
int numParticles;
int counter=0;

// ------------colors--------------
PImage myImage;
ArrayList colors; 
boolean finished = false;
int position = 0;

void setup() {
  size(700, 700, P3D);
  myImage = loadImage("pic.png");
  colors = new ArrayList();
  
  // ------------sound--------------
  textMode(SCREEN);
  minim = new Minim(this);
  mic = minim.getLineIn(Minim.MONO, 1024);
  fft = new FFT(mic.bufferSize(), mic.sampleRate());
  windowName = "None";
}

void draw() {
  background(255);
  // ------------rotation with mouse click--------------
  translate(width/2, height/2);
  rotateX(rotX + distY);
  rotateY(rotY + distX);

  // ------------sphere--------------
  float n = 100;
  for (float i=0; i<2*PI; i+=PI/n) {
    float x=cos(i);
    float y=sin(i);
    float time = millis()*0.001;
    float radius = 300; //no noise
    //float radius = 300 + noise(time, i)*50; // noise
    float increment=1;

    for (float j=0; j<(radius+increment); j+=increment) {
      float circleX = x*j+width/4;
      float circleY = y*j+height/4;
      float circleZ = abs(sqrt(radius*radius-(x*x*j*j+y*y*j*j)));
      if (finished) {
        colorClass c3 = (colorClass) colors.get(int(j));
        //println("c3.colorImage: " + c3.colorImage);
        stroke(c3.colorImage);
      }
      point(circleX, circleY, circleZ);
      point(circleX, circleY, -circleZ);
      if (counter==0) {
        numParticles++;
        println("numParticles: " + numParticles);
      }
    }
  }
  counter++;
  // ------------sound--------------
  stroke(0);
  fft.forward(mic.mix);
  for(int i = 0; i < fft.specSize(); i++)
  {
    // draw the line for frequency band i, scaling it by 4 so we can see it a bit better
    line(i, height, i, height - fft.getBand(i)*10);
  }
  fill(0);
}

// ------------colors--------------
void storeColor() {
  println("start");
  finished = false;
  for (int i=0; i<myImage.width; i++) {
    for (int j=0; j<myImage.height; j++) {

      color c = myImage.get(i, j);
      //ellipse(width/2, height/2, 100, 100);
      println("c: " + c);
      colors.add(new colorClass());
      position++;
      println("position: " + position);
      colorClass c2 = (colorClass) colors.get(position-1);
      c2.colorImage = c;
      //colors.add(color2);
      //println("2000: " + colors.get(2000));
      println("size: " + colors.size());
    }
  }

  finished = true;
  println("finished");
}

void mouseClicked() {
  thread("storeColor");
}

// ------------sound--------------
void stop(){
  mic.close();
  minim.stop();
  super.stop();
}

// ------------rotation with mouse click--------------
void mousePressed()
{
  lastX = mouseX;
  lastY = mouseY;
}
void mouseDragged()
{
  distX = radians(mouseX - lastX);
  distY = radians(lastY - mouseY);
}
void mouseReleased()
{
  rotX += distY;
  rotY += distX;
  distX = distY = 0.0;
}
