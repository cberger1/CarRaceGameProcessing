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

float[] lineIntersect(PVector a,PVector b,PVector c,PVector d) {
  float uA = ((d.x-c.x)*(a.y-c.y) - (d.y-c.y)*(a.x-c.x)) / ((d.y-c.y)*(b.x-a.x) - (d.x-c.x)*(b.y-a.y));
  float uB = ((b.x-a.x)*(a.y-c.y) - (b.y-a.y)*(a.x-c.x)) / ((d.y-c.y)*(b.x-a.x) - (d.x-c.x)*(b.y-a.y));
  float[] intersections = {uA,uB};
  return intersections;  
}

boolean carInsideRaceTrack(){
  boolean intersect = false;
  PVector a,b,c,d = new PVector(0,0);
  while (!intersect){
    for (int co = 1;co < corners.length;co++){
      for (int po = 1;po < points.length;po++){
        a = points[po - 1]; b = points[po];
        c = corners[co - 1]; d = corners[co];
        float uA = ((d.x-c.x)*(a.y-c.y) - (d.y-c.y)*(a.x-c.x)) / ((d.y-c.y)*(b.x-a.x) - (d.x-c.x)*(b.y-a.y));
        float uB = ((b.x-a.x)*(a.y-c.y) - (b.y-a.y)*(a.x-c.x)) / ((d.y-c.y)*(b.x-a.x) - (d.x-c.x)*(b.y-a.y));
        if (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1) {
          intersect = true;
        }
      }
    }
  }
  return intersect; 
}
