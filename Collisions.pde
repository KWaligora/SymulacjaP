class Collisions{
  Ball ball;
  Box box;
  boolean FirstCollision;
  boolean SecondCollision;
  
  public Collisions(Ball ball, Box box){
    this.ball = ball;
    this.box = box;
    this.FirstCollision = false;
    this.SecondCollision = true;
  }
  
  void Check(){
    if(box.GetIsHovered() && !FirstCollision){
      FirstCollision = true;
      box.OnCollision(ball.GetSpeed(), ball.GetMass());
      ball.OnCollision(box.GetMass());      
    }
    else if(!box.GetIsHovered() && FirstCollision){
      SecondCollision = false;
    }
     if(box.GetIsHovered() && !SecondCollision){
       SecondCollision = true;
       box.OnCollision(ball.GetSpeed(), ball.GetMass());
       ball.OnCollision(0.0); 
     }
  }
}
