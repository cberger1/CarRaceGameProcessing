
PImage carImg;

Car car = new Car();

void setup() {
  size(800,800);
  background(255);
  carImg = loadImage("carImage.png"); //2400 x 1190
  carImg.resize(60,30); 
}

void draw() {
  background(255);
  textSize(16);
  fill(0);
  text("fps : " + round(frameRate),0,16);
  translate(width/2,height/2);
  stroke(0);
  strokeWeight(5);
  fill(255);
  ellipse(0,0,width-5,height-5);
  //line(0,0,car.pos.x,car.pos.y);
  car.show();
  
  car.update();
}
