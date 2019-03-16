float truningAnge = radians(5);
int sizeX = 40;
int sizeY = 20;
float maxSpeed = 8;

class Car {

  PVector pos = new PVector(0, 0);
  PVector direction = new PVector(1, 0);
  PVector[] corners = new PVector[4];
  float speed = 0;
  float currentAngle = 0;
  PVector[] intersectionPoints = new PVector[4];


  void reset() {
    pos = new PVector(0, 0);
    direction = new PVector(1, 0);
    speed = 0;
    currentAngle = 0;
    for (int i = 0; i < corners.length; i++) {
      corners[i] = new PVector(0, 0);
      intersectionPoints[i] = new PVector();
    }
  }

  void showInfo() {
    strokeWeight(10);
    //show the corners of the car; Color: blue
    stroke(0, 0, 255);
    for (int i = 0; i < corners.length; i++) {
      point(corners[i].x, corners[i].y);
    }
    //show position of the car; Color: red
    stroke(255, 0, 0);
    point(pos.x, pos.y);
    //show fps
    textSize(16);
    fill(0);
    text("fps : " + round(frameRate), 0-width/2, 16-height/2);
    //show intersectionPoints
    for (int i = 0; i < corners.length; i++) {
      stroke(#E836CB);
      strokeWeight(20);
      point(intersectionPoints[i].x, intersectionPoints[i].y);
      stroke(0);
      strokeWeight(2);
      line(intersectionPoints[i].x, intersectionPoints[i].y, corners[i].x, corners[i].y);
      
    }
  }

  void show() {
    strokeWeight(1);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(currentAngle);
    image(carImg, -sizeX/2, -sizeY/2);
    popMatrix();
  }

  void update() {
    if (keyPressed == true) {
      if (key == 'a' && speed != 0) {
        direction.rotate(-truningAnge);
        currentAngle -= truningAnge;
      }
      if (key == 'd' && speed != 0) {
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
    corners[0].x = pos.x + direction.x * sizeX/2 - direction.y * sizeY/2;
    corners[0].y = pos.y + direction.y * sizeX/2 + direction.x * sizeY/2;
    corners[1].x = pos.x + direction.x * sizeX/2 + direction.y * sizeY/2;
    corners[1].y = pos.y + direction.y * sizeX/2 - direction.x * sizeY/2;
    corners[2].x = pos.x - direction.x * sizeX/2 - direction.y * sizeY/2;
    corners[2].y = pos.y - direction.y * sizeX/2 + direction.x * sizeY/2;
    corners[3].x = pos.x - direction.x * sizeX/2 + direction.y * sizeY/2;
    corners[3].y = pos.y - direction.y * sizeX/2 - direction.x * sizeY/2;
  }
  
  float[] getData(RadnomRoad r) {
    float[] data = new float[4];
    float dist;
    PVector a, b, c, d = new PVector(0, 0);
    
    for (int co = 0; co < corners.length; co++) {
      b = PVector.add(corners[co],negative(pos));
      b.div(sqrt(sq(b.x) + sq(b.y))); //normalize
      b.mult(height); //scale: up to where do you want it to check if its intersects [in pixels]
      b.add(pos);
      a = pos;
      data[co] = sqrt(sq(height)+sq(width));
      for (int j = 0; j < 2; j++) {
        for (int i = 1; i < r.divisions + 1; i++) {
          c = r.road[j][i - 1]; 
          d = r.road[j][i % r.divisions];
          float uA = ((d.x-c.x)*(a.y-c.y) - (d.y-c.y)*(a.x-c.x)) / ((d.y-c.y)*(b.x-a.x) - (d.x-c.x)*(b.y-a.y));
          float uB = ((b.x-a.x)*(a.y-c.y) - (b.y-a.y)*(a.x-c.x)) / ((d.y-c.y)*(b.x-a.x) - (d.x-c.x)*(b.y-a.y));
          stroke(#36E860);
          strokeWeight(10);
          point(b.x,b.y);
          if (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1) {
            dist = sqrt(sq(uA * (b.x-a.x)) + sq(uA * (b.y-a.y)));
            if (dist < data[co]) {
              data[co] = dist;
              intersectionPoints[co].x = a.x + (uA * (b.x-a.x));
              intersectionPoints[co].y = a.y + (uA * (b.y-a.y));
            }
          }
        }
      }
    } 
    return data;
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
