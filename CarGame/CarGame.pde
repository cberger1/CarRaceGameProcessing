
Car car = new Car();

void setup() {
  size(800,800);
  background(255);
}

void draw() {
  translate(width/2,height/2);
  background(255);
  stroke(0);
  strokeWeight(5);
  fill(255);
  ellipse(0,0,width-5,height-5);
  //line(0,0,car.pos.x,car.pos.y);
  car.show();
  
  car.update();
}
