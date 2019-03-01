float angle = radians(2);
float totaleAngle = 0;
float sizeX = 40;
float sizeY = 20;
PVector pos = new PVector(0,0);
PVector direction = new PVector(1,0);
PVector speed = new PVector(0,0);
float acceleration = 0;

class Car {

  void show() {
    fill(255);
    stroke(0);
    strokeWeight(1);
    //line(pos.x,pos.y,pos.x + direction.x * 20,pos.y + direction.y * 20);
    printCar();  
  }
  
  void update() {
    if (keyPressed == true) {
      if (key == 'a'){
        direction.rotate(-angle);
        totaleAngle -= angle;
      }
      if (key == 'd'){
        direction.rotate(angle);
        totaleAngle += angle;
      }
      if (key == 'w'){
        if (acceleration < 4){
          acceleration += 0.1; 
        }
      }
      if (key == 's'){
        if (acceleration > -1){
          acceleration -= 0.05;        
        }
      }
    }
    
    speed = PVector.mult(direction,acceleration);
    pos.add(speed);
    
    if (pos.dist(new PVector(0,0)) > width/2) {
      pos.x = 0;
      pos.y = 0; 
    }
  }  
}

void printCar(){
  pushMatrix();
  translate(pos.x,pos.y);
  rotate(totaleAngle);
  fill(255,0,0);
  noStroke();
  rect(-sizeX/2,-sizeY/2,sizeX,sizeY);
  popMatrix();
}

PVector add3Vec(PVector a,PVector b,PVector c){
  PVector result = new PVector();
  result.x = a.x + b.x + c.x;
  result.y = a.y + b.y + c.y;
  result.z = a.z + b.z + c.z;
  return result;
}

PVector negative(PVector a){
  PVector result = new PVector();
  result.x = -a.x;
  result.y = -a.y;
  result.z = -a.z;
  return result;
}
