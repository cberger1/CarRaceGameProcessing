
PImage carImg;
Boolean raceNotCreated = true;

Car car = new Car();
Racetrack racetrack = new Racetrack();

void setup() {
  size(800, 800);
  background(255);
  carImg = loadImage("carImage.png"); //2400 x 1190
  carImg.resize(60, 30);
}

void draw() {
  if (raceNotCreated) {
    racetrack.create();
  } else {
    background(255);
    textSize(16);
    fill(0);
    text("fps : " + round(frameRate), 0, 16);
    racetrack.show();
    translate(width/2, height/2);
    car.show();
    car.update();
  }
}

void mouseClicked() {
  points = (PVector[]) append(points, new PVector(mouseX, mouseY));
}
