ArrayList particles; //delcaring 

void setup(){
 size(500,500);
 particles = new ArrayList();
 
}

void draw(){
  background(255);
  for(int i=particles.size()-1; i>=0; i--){
    Particle p= (Particle) particles.get(i);
    p.run();
    p.gravity();
    p.display();
    
    if(p.yPos>height || p.yPos < 0){
     particles.remove(i); 
    }
    println(particles.size());
  }
 
  
}

void mousePressed(){
    //nameOfArrayList.add(name of class);
     particles.add(new Particle()); 
   
}
