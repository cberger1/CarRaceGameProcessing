
Car car = new Car();

void setup() {
  size(500,500);
  background(255);
}

void draw() {
  translate(width/2,height/2);
  background(255);
  stroke(0);
  strokeWeight(5);
  ellipse(0,0,width-5,height-5);
  car.show();
  car.update();
}

class Car {
  int size = 20;
  float angle = radians(2);
  PVector pos = new PVector(0,0);
  PVector direction = new PVector(1,0);
  PVector speed = new PVector(0,0);
  float acceleration = 1;

  void show() {
    fill(255);
    stroke(0);
    strokeWeight(1);
    ellipse(pos.x,pos.y,size,size);
  }
  
  void update() {
    if (keyPressed == true) {
      if (key == 'a'){
        direction.rotate(-angle);  
      }
      if (key == 'd'){
        direction.rotate(angle);  
      }
      if (key == 'w'){
        if (acceleration < 2){
          acceleration += 0.2; 
        }
      }
      if (key == 's'){
        if (acceleration > -1){
          acceleration -= 0.2;        
        }
      }
    }
    speed = PVector.mult(direction,acceleration);
    pos.add(speed);
    if (acceleration < 0) {
    }
    if (pos.dist(new PVector(0,0)) > width/2 - size/2) {
      pos.x = 0;
      pos.y = 0; 
    }
  }  
}
