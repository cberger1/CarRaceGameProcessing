
class Racetrack {
  
  int divisions = 6;
  int inner = 200;
  int outer = 350;
  PVector[][] road = new PVector[2][divisions];

  boolean raceCreated = false;
  PVector[] points = new PVector[0];

  void create() {
    int i = points.length - 1;
    if (i == -1) {
      stroke(#E5569E); 
      strokeWeight(30);
      point(mouseX - width/2, mouseY - height/2);
    } else {
      stroke(#E5569E); 
      strokeWeight(30);
      point(points[0].x, points[0].y);
      stroke(0);
      strokeWeight(5);
      line(points[i].x, points[i].y, mouseX - width/2, mouseY - height/2);
      if (PVector.dist(points[i], points[0]) < 30 && i != 0) {
        raceCreated = true;
        points[i] = points[0];
      }
    }
  }
  
  void show() {
    for (int i = 1; i < points.length; i++) {
      stroke(0);
      strokeWeight(5);
      line(points[i - 1].x, points[i - 1].y, points[i].x, points[i].y);
    }
  }

  void createRandom() {
    float moreless = 25;
    PVector direction = new PVector(1, 0);
    for (int i = 0; i < divisions; i++) {
      road[0][i] = PVector.mult(direction, inner + random(-moreless, moreless));
      road[1][i] = PVector.mult(direction, outer + random(-moreless, moreless));
      direction.rotate(TWO_PI / divisions);
    }
  }

  void showRandomRoad() {
    stroke(100);
    strokeWeight(5);
    point(200, 200);
    for (int j = 0; j < 2; j++) {
      for (int i = 1; i < divisions + 1; i++) {
        line(road[j][i-1].x, road[j][i-1].y, road[j][i % divisions].x, road[j][i % divisions].y);
      }
    }
  }
}
