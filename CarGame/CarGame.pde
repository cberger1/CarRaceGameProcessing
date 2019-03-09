
PImage carImg;

Car car = new Car();
Racetrack racetrack = new Racetrack();

void setup() {
  size(800, 800);
  background(255);
  frameRate(30);
  carImg = loadImage("carImage.png"); //2400 x 1190
  carImg.resize(sizeX, sizeY);
  car.reset();
}

void draw() {
  translate(width/2, height/2);
  background(255);
  if (!racetrack.raceCreated) {
    racetrack.create();
    racetrack.show();
  } else {
    if (carIntersectRaceTrack()){
      car.reset();
    }
    racetrack.show();    
    car.update();
    car.show();
    car.showInfo();
  }
}


void mouseClicked() {
  if (!racetrack.raceCreated) {
    racetrack.points = (PVector[]) append(racetrack.points, new PVector(mouseX - width/2, mouseY - height/2));
  }
}

boolean carIntersectRaceTrack(){
  boolean intersect = false;
  PVector a,b,c,d = new PVector(0,0);
    for (int co = 1;co < car.corners.length;co++){
      for (int po = 1;po < racetrack.points.length;po++){
        a = racetrack.points[po - 1]; b = racetrack.points[po];
        c = car.corners[co - 1]; d = car.corners[co];
        float uA = ((d.x-c.x)*(a.y-c.y) - (d.y-c.y)*(a.x-c.x)) / ((d.y-c.y)*(b.x-a.x) - (d.x-c.x)*(b.y-a.y));
        float uB = ((b.x-a.x)*(a.y-c.y) - (b.y-a.y)*(a.x-c.x)) / ((d.y-c.y)*(b.x-a.x) - (d.x-c.x)*(b.y-a.y));
        if (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1) {
          intersect = true;
        }
      }
  }
  return intersect; 
}
