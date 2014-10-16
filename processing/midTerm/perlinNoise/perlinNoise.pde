//sketch by Nicole Yi Messier
//nicoleyimessier.com


//----------perlin noise------------------
ArrayList points = new ArrayList();
Boolean density = false;
float x, y;
int numPoints = 100;
int counter = 10;

//----------colors------------------
PImage myImage;
ArrayList colors; 
boolean finished = false;
int position = 0;
int counterColor = 0;
int colorsLength;

void setup() {
  size(500, 500);
  background(255);
  smooth();
  
  //----------colors------------------
  myImage=loadImage("philly2.png");
  thread("storeColor");
  colors = new ArrayList();
}

void draw() {
  
  //----------colors------------------
  counterColor++;
  colorClass c3 = (colorClass) colors.get(int(counter));
  //println("c3.colorImage: " + c3.colorImage);
  //fill(c3.colorImage);
 
  if(counterColor == colorsLength){
   counterColor=0; 
  };
  
  //----------perlin noise------------------
  //noiseDetail(lod, falloff)
  //lod - int, # of octaves to be used by noise
  //falloff - falloff factor of each octave 
  noiseDetail(8, 0);

  for (int i=points.size()-1; i>0; i--) {
    Point p = (Point)points.get(i);
    p.update(c3.colorImage);
    if (p.finished) {
      points.remove(i);
    }
  }
  if (density) {
    for (int i=0; i<numPoints; i+=counter) {
      x = random(0, width);
      y = random(0, height);
      points.add(new Point(x, y));
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

void mousePressed() {
  density = true;
}

void mouseReleased() {
  density = false;
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
