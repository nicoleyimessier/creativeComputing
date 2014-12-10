//------------mask--------------
PImage bImage;
int iw, ih;

//--------storing points-----------
ArrayList points;

//--------storing shapes-----------
ArrayList shapes;
int tag; 

int size = 4; 
int lineCounter=0;

void setup() {
  size(640, 513, P2D);
  bImage = loadImage("kitchen1.png");
  image(bImage, 0, 0); 

  //--------storing points-----------
  points = new ArrayList();

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

  //--------creating shape-----------
  //press c to create the shape 
  if (key == 's') { 
    tag++;
    shapes.add(new Shape());
    Shape s = (Shape) shapes.get(0);
    s.shapeSet();
    for (int i=points.size()-1; i>=0; i--) {
      Point p = (Point) points.get(i);
      s.shapeVertex(p.x, p.y);
    }
    s.display();
    s.storeTag(tag);
    println("tag: " + tag);
    println("shapes.size(): " + shapes.size());
    //println("shape created!");

   s.pGraphic();
        
    //--------delete points-----------
    //after the shape is created, delete the points
    for (int i=points.size()-1; i>=0; i--) {
      points.remove(i);
    }
    lineCounter=0;
    println("arrayList cleared!" + ", points size: " + points.size());
  }

  //--------calling stored shape-----------

  if (key == '1') {
    Shape s = (Shape) shapes.get(0);
    s.shapeSet();
    s.display();
    println("drawing 1 stored shape");
  }

  if (key == '2') {
    println("drawing 2 stored shape");
  }

  if (key == '3') {
    println("drawing 3 stored shape");
  }

  if (key == '4') {
    println("drawing 4 stored shape");
  }

  if (key == '5') {
    println("drawing 5 stored shape");
  }
}

