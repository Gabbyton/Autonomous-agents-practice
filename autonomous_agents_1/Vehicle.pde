class Vehicle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  float r;
  float maxforce;
  float maxspeed;
  
  public Vehicle( float x , float y ) {
    position = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    r = 3.0;
    maxspeed = 4.0;
    maxforce = 0.1;
  }
  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void seek(PVector target) {
    PVector desired = PVector.sub(target,position);
    float d = desired.mag();
    desired.normalize();
    if( d < 100 ) {
      float m = map( d , 0 , 100 , 0 , maxspeed );
      desired.mult(m);
    }
    else {
      desired.mult(maxspeed);
    }
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }
  
  
  void display() {
    float theta = velocity.heading() + PI/2;
    fill(175);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(position.x,position.y);
    rotate(theta);
    beginShape();
    vertex(0,-r*2);
    vertex(-r,r*2);
    vertex(r,r*2);
    endShape(CLOSE);
    popMatrix();
  }
}
