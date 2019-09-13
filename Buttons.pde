String MassBall = "";

public void Start(){
  box.SetMass(float(cp5.get(Textfield.class,"MassBar").getText()));
  ball.SetMass(float(cp5.get(Textfield.class,"MassBall").getText()));
  ball.SetSpeed(float(cp5.get(Textfield.class,"SpeedBall").getText()));
}
