//--------storing points-----------
ArrayList points;

//--------storing shapes-----------
ArrayList shapes;

//--------creating shape-----------
PShape s; 
int size = 4; 
int lineCounter=0;

void setup() {
  size(500, 500, P2D);  

  //--------storing points-----------
  points = new ArrayList();

  //--------creating shape-----------
  s = createShape();
  
  //--------storing shapes-----------
  shapes = new ArrayList();
}

void draw() {
}

void mousePressed() {
  //--------storing points-----------
  points.add(new Point());
  Point p = (Point) points.get(points.size()-1);
  p.storePoint();
  println("points size: " + points.size());
  lineCounter++;
  println("lineCounter: " + lineCounter);

  //--------shape markers----------
  ellipse(p.x, p.y, size, size);
  if (points.size()>=2) {
    Point p1 = (Point) points.get(lineCounter-2);
    Point p2 = (Point) points.get(lineCounter-1);
    line(p1.x, p1.y, p2.x, p2.y);
  }
}

void keyPressed() {

  //--------storing points-----------
  //press d to delete 
  if (key == 'd') { 
    for (int i=points.size()-1; i>=0; i--) {
      points.remove(i);
    }
    lineCounter=0;
    println("arrayList cleared!" + ", points size: " + points.size());
  }

  //--------creating shape-----------
  //press c to create the shape 
  if (key == 's') { 
    s.beginShape();
    s.fill(0, 0, 255);
    s.noStroke();

    for (int i=points.size()-1; i>=0; i--) {
      //s.vertex(points[i].x, points[i].y);
      Point p = (Point) points.get(i);
      //println(p.x);
      s.vertex(p.x, p.y);
    }

    s.endShape(CLOSE);
    println("shape created!");
    shape(s);
  }
}

