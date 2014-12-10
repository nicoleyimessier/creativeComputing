ArrayList points;

void setup() {
  size(500, 500);  
  points = new ArrayList();
  smooth();
}

void draw() {
}

void mousePressed() {
  points.add(new Point());

  for (int i=points.size()-1; i>=0; i--) {
    Point p = (Point) points.get(i);
    p.storePoint();
  }

  println("points size: " + points.size());
}

void keyPressed() {
  if (key == 'c') {
    for (int i=points.size()-1; i>=0; i--) {
      points.remove(i);
    }
    println("arrayList cleared!" + ", points size: " + points.size());
  }
}

