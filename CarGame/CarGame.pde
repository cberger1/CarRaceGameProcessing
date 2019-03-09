
PImage carImg;

Car car = new Car();
Racetrack racetrack = new Racetrack();

void setup() {
  size(800, 800);
  background(255);
  frameRate(30);
  carImg = loadImage("carImage.png"); //2400 x 1190
  carImg.resize(sizeX, sizeY);
  //println(lineIntersect(new PVector(0,0),new PVector(4,4),new PVector(4,0),new PVector(0,4)));
  car.setupCar();
}

void draw() {
  translate(width/2, height/2);
  if (!racetrack.raceCreated) {
    racetrack.create();
  } else {
    if (carInsideRaceTrack()){
      pos = new PVector(0,0);  
    }
    background(255);textSize(16);
    fill(0);
    text("fps : " + round(frameRate), 0-width/2, 16-height/2);
    racetrack.show();    
    car.update();
    car.show();
    car.showInfo();
  }
}

void mouseClicked() {
  if (!racetrack.raceCreated) {
    points = (PVector[]) append(points, new PVector(mouseX - width/2, mouseY - height/2));
  }
}
