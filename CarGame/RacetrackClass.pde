boolean firstPoint = true;
PVector[] points = new PVector[0];

class Racetrack {

  void create() {
    int i = points.length - 1;
    if (i == 0) {
      stroke(#E5569E); 
      strokeWeight(30);
      point(points[i].x, points[i].y);
    } else if (i > 0) {
      stroke(0);
      strokeWeight(5);
      if (PVector.dist(points[i], points[0]) < 30) {
        raceNotCreated = false;
        points[i] = points[0];
      }
      line(points[i - 1].x, points[i - 1].y, points[i].x, points[i].y);
    }
  }
  
  void show(){
    for (int i = 1;i < points.length;i++){
      stroke(0);
      strokeWeight(5);
      line(points[i - 1].x, points[i - 1].y, points[i].x, points[i].y);
    } 
  }
  
}
