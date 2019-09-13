public void Start(){
  box.SetMass(float(cp5.get(Textfield.class,"MassBar").getText()));
  ball.SetMass(float(cp5.get(Textfield.class,"MassBall").getText()));
  ball.SetSpeed(float(cp5.get(Textfield.class,"SpeedBall").getText()));
}

public void Reset(){
  ball = new Ball(radius);
  box = new Box(300, 350, widthR, heightR, radius);
  collisions = new Collisions(ball, box);
}
