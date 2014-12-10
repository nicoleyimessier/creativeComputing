class Shape {
  PShape s;
  int tag; 

  Shape() {
  }

  void shapeSet() {
    s = createShape();
    s.beginShape();
    s.fill(0, 0, 255);
    s.noStroke();
    //println("shape set!");
  }

  void shapeVertex(int x, int y) {
    s.vertex(x, y);
    //println("shape vertex!");
  }

  void display() {
    s.endShape(CLOSE);
    shape(s);
    //println("shape created!");
  }
  
  void storeTag(int x){
   tag = x; 
  }
}

