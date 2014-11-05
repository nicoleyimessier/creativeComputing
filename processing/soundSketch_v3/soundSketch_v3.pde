import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput mic;
AudioPlayer player;
FFT fft;
AudioSample one;
AudioSample two;


String windowName;
float sound;
float soundTwo;
color colorLine;
float amplitude = 100.0;

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
  player = minim.loadFile("death.mp3");
  one = minim.loadSample( "one.mp3", 512);
}

void draw() {
  background(0);
  fft.forward(mic.mix);
  soundTwo = fft.getBand(0)*amplitude;
  println("sound2: " + soundTwo);
  for (int i = 0; i < width; i++)
  {
    // draw the line for frequency band i, scaling it by 4 so we can see it a bit better
    colorLine = color(random(255), random(255), random(255));
    stroke(colorLine);
    sound = fft.getBand(i)*10;
    println("sound: " + fft.getBand(i)*100);
    line(fft.getBand(i)*100, 0, i, height - fft.getBand(i)*100);
    fill(colorLine);
    fill(0);
    //translate(width/2, height/2, 100);
    //sphere(100);
    //translate(-width/2, -height/2, -100);
    //sphere(fft.getBand(0)*100);
  }


  // ------------rotation with mouse click--------------
  translate(width/2, height/2);
  rotateX(rotX + distY);
  rotateY(rotY + distX);

  // ------------sphere--------------
  stroke(255);
  fill(255);
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

  if (mousePressed) {
    player.play();
  }

}

void stop(){
  mic.close();
  minim.stop();
  super.stop();
}

void keyPressed() 
{
  if ( key == 's' ) one.trigger();
}
