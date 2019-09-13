import controlP5.*;

ControlP5 cp5;
Ball ball;
Box box;
Collisions collisions;

int widthR = 20;
int heightR = 300;
int radius = 18;

void setup() {
  size(950, 750, P3D); 
  cp5 = new ControlP5(this);
  CreateFront();
  strokeWeight(2);
  ball = new Ball(radius);
  box = new Box(300, 350, widthR, heightR, radius);
  collisions = new Collisions(ball, box);
  
}

void draw() {  
  background(255);
  noStroke();
  fill(color(209, 209, 209));
  rect(720, 0, 230, height);
  stroke(0);
  box.Update(ball.GetLocation().x, ball.GetLocation().y);
  box.Draw();
  ball.Draw();
}
