import controlP5.*;

ControlP5 cp5;
Ball ball;
Box box;

int widthR = 20;
int heightR = 300;
int radius = 18;

void setup() {
  size(950, 750, P3D); 
  cp5 = new ControlP5(this);
  CreateFront();
  strokeWeight(2);
  ball = new Ball(radius);
  box = new Box(widthR, heightR, radius);
  box.translate(300, 350);
  box.rotate(3);
}

void draw() {  
  background(255);
  noStroke();
  fill(color(209, 209, 209));
  rect(720, 0, 230, height);
  stroke(0);
  box.rotate(0.1);
  box.update(ball.GetLocation().x, ball.GetLocation().y);
  box.draw();
  ball.Draw();
}
