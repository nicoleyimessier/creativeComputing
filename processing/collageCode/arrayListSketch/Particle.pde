class Particle{
 float xPos;
 float yPos; 
 float xSpeed; 
 float ySpeed; 

 Particle(){
  xPos = mouseX; 
  yPos = mouseY;
  xSpeed = random(-1,1);
  ySpeed = random(-3, 0);
 }
 
  void display(){
    fill(0);
    ellipse(xPos, yPos, 50, 50);
  }
  
  void gravity(){
    ySpeed += 0.05;
  }
  
  void run(){
    xPos+=xSpeed;
    yPos+=ySpeed;
  }
 } 
