class Collisions{
  Ball ball;
  Box box;
  
  public Collisions(Ball ball, Box box){
    this.ball = ball;
    this.box = box;
  }
  
  void Check(){
    if(box.GetIsHovered()){
      box.OnCollision();
      ball.OnCollision();
    }
  }
}
