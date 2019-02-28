class Car {
  float angle = radians(2);
  PVector pos = new PVector(0,0);
  PVector direction = new PVector(1,0);
  PVector speed = new PVector(0,0);
  float acceleration = 0;

  void show() {
    fill(255);
    stroke(0);
    strokeWeight(1);
    //line(pos.x,pos.y,pos.x + direction.x * 20,pos.y + direction.y * 20);
    drawCar(direction,pos,40,20);
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

void drawCar(PVector direction,PVector position,float w,float h){
  PVector hdw = new PVector(); //half direction width
  PVector hdh = new PVector(); //half direction height
    PVector[] c = new PVector[4]; //corners
  hdw.x = direction.x * w/2; 
  hdw.y = direction.y * w/2;
  hdh.x = -direction.y * h/2; 
  hdh.y = direction.x * h/2; 
  c[0] = add3Vec(position,hdh,hdw);
  c[1] = add3Vec(position,hdh,negative(hdw));
  c[2] = add3Vec(position,negative(hdh),negative(hdw));
  c[3] = add3Vec(position,negative(hdh),hdw);
  fill(255,0,0);
  noStroke();
  beginShape();
  vertex(c[0].x,c[0].y);
  vertex(c[1].x,c[1].y);
  vertex(c[2].x,c[2].y);
  vertex(c[3].x,c[3].y);
  endShape(CLOSE);
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
