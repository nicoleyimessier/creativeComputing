class Point {

  int x;
  int y; 

  void storePoint() {
      x = mouseX;
      y = mouseY;
      println("x: " + x + ", y: " + y + ", point stored!");
  }
}

