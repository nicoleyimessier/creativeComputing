// This will keep track of whether the thread is finished
boolean finished = false;
float amp = 100;
float diam = 10;
float circleX;
float circleY;

void setup() {
  size(500, 500);

  //start the thread
}

void draw() {
  thread("loadThread");
  
  if (!finished) {
    background(0);
  } 
  else {
    background(100);
  }
}

void loadThread() {

  if (!finished) {
    float time = millis()/1000.0;
    float sine = sin(time);
    float cose = cos(time);
    println("time: " + time);
    circleX = map(cose, -1, 1, 0, width);
    circleY = map(sine, -1, 1, 0, height);
    ellipse(circleX, circleY, diam, diam);

    if (time>2*PI) {
      finished = true;
    }
  }
}
