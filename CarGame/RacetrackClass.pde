
class Racetrack {
  
  int j = 0;
  boolean raceCreated = false;
  PVector[] points = new PVector[0];
  
  void create() {
    int i = points.length - 1;
    if (i == -1) {
      stroke(#E5569E); 
      strokeWeight(30);
      point(mouseX - width/2,mouseY - height/2);  
    } else {
      stroke(#E5569E); 
      strokeWeight(30);
      point(points[0].x, points[0].y);
      stroke(0);
      strokeWeight(5);
      line(points[i].x, points[i].y, mouseX - width/2, mouseY - height/2);
      if (PVector.dist(points[i], points[0]) < 30 && i != 0) {
        raceCreated = true;
        j = i;
        points[i] = points[0];
      }     
    }
    if (j > 0) {
      
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
