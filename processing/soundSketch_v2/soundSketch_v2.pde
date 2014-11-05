import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput mic;
FFT fft;
String windowName;
float sound;
float soundTwo;
color colorLine;
float amplitude = 1.0;

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
  textMode(SCREEN);
  minim = new Minim(this);
  mic = minim.getLineIn(Minim.MONO, 1024);
  fft = new FFT(mic.bufferSize(), mic.sampleRate());
  windowName = "None";
}

void draw() {
  background(255);
  
  

  fft.forward(mic.mix);
  soundTwo = fft.specSize()*amplitude;
  println("sound2: " + soundTwo);
  for (int i = 0; i < fft.specSize(); i++)
  {
    // draw the line for frequency band i, scaling it by 4 so we can see it a bit better
    colorLine = color(random(255),random(255),random(255));
    stroke(colorLine);
    sound = fft.getBand(i)*10;
    //println("sound: " + sound);
    line(i, height, i, height - fft.getBand(i)*100);
    fill(colorLine);
    
  }
  

  // ------------rotation with mouse click--------------
  translate(width/2, height/2);
  rotateX(rotX + distY);
  rotateY(rotY + distX);

  // ------------sphere--------------
  stroke(0);
  fill(0);
  float n = 100;
  for (float i=0; i<2*PI; i+=PI/n) {
    float x=cos(i);
    float y=sin(i);
    float time = millis()*0.001;
    float radius = 300; //no noise
    //float radius = 
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
        //println("numParticles: " + numParticles);
      }
    }
  }
  counter++;
}

void stop()
{
  mic.close();
  minim.stop();
  super.stop();
}
