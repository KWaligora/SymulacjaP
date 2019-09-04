class Rectangle{
  final int widthR;
  final int heightR;
  PVector Location = new PVector(300, 350);
  float angle = 0.0;
  
  public Rectangle(int widthR, int heightR){
    this.widthR = widthR;
    this.heightR = heightR;
  }
  
  public void Draw(){
    stroke(0);
    fill(255);
    push();
    rectMode(CENTER);
    translate(Location.x, Location.y);
    rotate(angle);
    rect(0, 0, widthR, heightR);
    pop();
    angle+= 0.1;
  }
  
  public void Move(){
    
  }
}
