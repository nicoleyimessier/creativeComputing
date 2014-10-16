class Point {
  float x, y;
  float xSpeed, ySpeed; 
  float maxSpeed = 10000;
  boolean finished = false;
  float thickness = 18; 
  float scale = .01;

  Point(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update(int colorFill) {
    stroke(0, thickness);
    float range = random(1);

    //noise(x point, y point)
    float cos = cos(noise(this.x*scale, this.y*scale)*TWO_PI);
    float sin = sin(noise(this.x*scale, this.y*scale)*TWO_PI);
    this.xSpeed = cos;
    this.ySpeed = -sin;

    //-----check boundaries of screen-------
    if (this.x>width) {
      this.finished = true;
    } 
    else if (this.x<0) {
      this.finished = true;
    }

    if (this.y>height) {
      this.finished = true;
    } 
    else if (this.y<0) {
      this.finished = true;
    }

    //-----check for max speed & reset-------
    if (this.xSpeed>maxSpeed) {
      this.xSpeed = maxSpeed;
    } 
    else if (this.xSpeed<-maxSpeed) {
      this.xSpeed = -maxSpeed;
    }

    if (this.ySpeed>maxSpeed) {
      this.ySpeed = maxSpeed;
    } 
    else if (this.ySpeed<-maxSpeed) {
      this.ySpeed = -maxSpeed;
    }
    
    this.x += this.xSpeed;
    this.y += this.ySpeed;
    stroke(colorFill);
    line(this.x+this.xSpeed, this.y+this.ySpeed, this.x, this.y);
  }
}
