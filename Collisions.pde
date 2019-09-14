class Collisions{
  Ball ball;
  Box box;
  boolean flag;
  
  public Collisions(Ball ball, Box box){
    this.ball = ball;
    this.box = box;
    this.flag = false;
  }
  
  void Check(){
    if(box.GetIsHovered() && !flag){
      flag = true;
      ball.OnCollision(box.GetMass());
      box.OnCollision(ball.GetSpeed(), ball.GetMass());
    }
  }
}
