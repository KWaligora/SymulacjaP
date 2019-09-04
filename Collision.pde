class Collision{
  Ball ball;
  Rectangle rectangle;
  
  public Collision(Ball ball, Rectangle rectangle){
    this.ball = ball;
    this.rectangle = rectangle;
  }
  
  public boolean Check(PVector LocationR, PVector LocationB){
    return true;
  }
}
