float truningAnge = radians(4);
float currentAngle = 0;
int sizeX = 40;
int sizeY = 20;
PVector pos = new PVector(0, 0);
PVector direction = new PVector(1, 0);
float speed = 0;
float maxSpeed = 8;
float pivotOffset = -10;
boolean showInfo = true;
PVector[] corners = new PVector[4];

class Car {
  
  void setupCar(){
    corners[0] = new PVector(sizeX/2 - pivotOffset,sizeY/2);
    corners[1] = new PVector(sizeX/2 - pivotOffset,-sizeY/2);
    corners[2] = new PVector(-sizeX/2 - pivotOffset,-sizeY/2);
    corners[3] = new PVector(-sizeX/2 - pivotOffset, sizeY/2);  
  }
  
  void show() {
    strokeWeight(1);
    pushMatrix();
    translate(pos.x - pivotOffset, pos.y);
    rotate(currentAngle);
    image(carImg, -sizeX/2 - pivotOffset, -sizeY/2);
    if (showInfo) {
      strokeWeight(10);
      //show the pivot point; Color: red
      stroke(255, 0, 0);
      point(0, 0);
      //show the corners of the car; Color; blue
      for (int i = 0; i < 4; i++) {
        stroke(0, 0, 255);
        point(corners[i].x, corners[i].y);
      }
    }
    popMatrix();
  }

  void update() {
    if (keyPressed == true) {
      if (key == 'a') {
        direction.rotate(-truningAnge);
        currentAngle -= truningAnge;
      }
      if (key == 'd') {
        direction.rotate(truningAnge);
        currentAngle += truningAnge;
      }
      if (key == 'w') {
        if (speed < maxSpeed) {
          speed += 0.1;
        }
      }
      if (key == 's') {
        if (speed > -(maxSpeed/4)) {
          speed -= 0.05;
        }
      }
    }
    //update postion
    pos.add(PVector.mult(direction, speed));
    //update the corners
    //corners[0] = new PVector(sizeX/2 - pivotOffset,sizeY/2);
    //corners[1] = new PVector(sizeX/2 - pivotOffset,-sizeY/2);
    //corners[2] = new PVector(-sizeX/2 - pivotOffset,-sizeY/2);
    //corners[3] = new PVector(-sizeX/2 - pivotOffset, sizeY/2);
  }
}

PVector add3Vec(PVector a, PVector b, PVector c) {
  PVector result = new PVector();
  result.x = a.x + b.x + c.x;
  result.y = a.y + b.y + c.y;
  result.z = a.z + b.z + c.z;
  return result;
}

PVector negative(PVector a) {
  PVector result = new PVector();
  result.x = -a.x;
  result.y = -a.y;
  result.z = -a.z;
  return result;
}
