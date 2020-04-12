Vehicle vehicle;
PVector target;
void setup() {
  size(1080,720);
  vehicle = new Vehicle(width/2,height/2);
  target = new PVector( width/2+200,height/2+200);
}

void draw() {
  background(255);
  target.x = mouseX;
  target.y = mouseY;
  
  strokeWeight(0);
  fill(255,0,0);
  ellipse(target.x,target.y,10,10);
  vehicle.seek(target);
  vehicle.update();
  vehicle.display();
}
