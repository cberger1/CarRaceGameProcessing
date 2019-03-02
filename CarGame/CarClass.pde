float truningAnge = radians(2);
float currentAngle = 0;
float sizeX = 40;
float sizeY = 20;
PVector pos = new PVector(0,0);
PVector direction = new PVector(1,0);
float speed = 0;
float pivotOffset = -10;
boolean showInfo = false;

class Car {
  void show() {
    strokeWeight(1);
    pushMatrix();
    translate(pos.x - pivotOffset,pos.y);
    rotate(currentAngle);
    image(carImg,-30 - pivotOffset,-15);
    if (showInfo){
      //pivot Point: red
      stroke(255,0,0); strokeWeight(10);
      point(0,0);
    }
    popMatrix(); 
  }
  
  void update() {
    if (keyPressed == true) {
      if (key == 'a'){
        direction.rotate(-truningAnge);
        currentAngle -= truningAnge;
      }
      if (key == 'd'){
        direction.rotate(truningAnge);
        currentAngle += truningAnge;
      }
      if (key == 'w'){
        if (speed < 4){
          speed += 0.1; 
        }
      }
      if (key == 's'){
        if (speed > -1){
          speed -= 0.05;        
        }
      }
    }
    pos.add(PVector.mult(direction,speed));
    if (pos.dist(new PVector(0,0)) > width/2) {
      pos.x = 0;
      pos.y = 0; 
    }
  }
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
