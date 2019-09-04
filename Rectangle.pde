class Rectangle{
  final int rWidth = 20;
  final int rHeight = 300;
  float angle = 0.0;
  
  
  public void Draw(){
    stroke(0);
    fill(255);
    push();
    rectMode(CENTER);
    translate(300, 350);
    rotate(angle);
    rect(0, 0, rWidth, rHeight);
    pop();
    angle+= 0.1;
  }
  
  public void Move(){
    
  }
}
