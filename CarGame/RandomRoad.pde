
class RadnomRoad {

  int divisions = 8;
  int innerRadius = 200;
  int outerRadius = 350;
  float moreless = 25;
  PVector[][] road = new PVector[2][divisions];

  void create() {
    PVector direction = new PVector(1, 0);
    for (int i = 0; i < divisions; i++) {
      road[0][i] = PVector.mult(direction, innerRadius + random(-moreless, moreless));
      road[1][i] = PVector.mult(direction, outerRadius + random(-moreless, moreless));
      direction.rotate(TWO_PI / divisions);
    }
  }

  void update(Car car) {
    PVector a, b, c, d = new PVector(0, 0);
    for (int co = 1; co < car.corners.length; co++) {
      for (int j = 0; j < 2; j++) {
        for (int i = 1; i < divisions + 1; i++) {
          a = road[j][i - 1]; 
          b = road[j][i % divisions];
          c = car.corners[co - 1]; 
          d = car.corners[co];
          float uA = ((d.x-c.x)*(a.y-c.y) - (d.y-c.y)*(a.x-c.x)) / ((d.y-c.y)*(b.x-a.x) - (d.x-c.x)*(b.y-a.y));
          float uB = ((b.x-a.x)*(a.y-c.y) - (b.y-a.y)*(a.x-c.x)) / ((d.y-c.y)*(b.x-a.x) - (d.x-c.x)*(b.y-a.y));
          if (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1) {
            car.pos = new PVector(0, (innerRadius + outerRadius)/2);
            car.direction = new PVector(1, 0);
            car.currentAngle = 0;
            car.speed = 0;
          }
        }
      }
    }
    println();
  }
  void display() {
    stroke(0);
    strokeWeight(5);
    fill(150);
    beginShape();
    for (int i = 0; i < divisions; i++) {
      vertex(road[1][i].x, road[1][i].y);
    }
    endShape(CLOSE);
    fill(255);
    beginShape();
    for (int i = 0; i < divisions; i++) {
      vertex(road[0][i].x, road[0][i].y);
    }
    endShape(CLOSE);
  }
  void show() {
    stroke(100);
    strokeWeight(5);
    for (int j = 0; j < 2; j++) {
      for (int i = 1; i < divisions + 1; i++) {
        line(road[j][i-1].x, road[j][i-1].y, road[j][i % divisions].x, road[j][i % divisions].y);
      }
    }
  }
}
