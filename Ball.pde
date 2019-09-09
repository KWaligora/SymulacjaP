class Ball{
  int Mass = 0;
  PVector Location = new PVector(650, 435);
  PVector Velocity = new PVector(-1,0);
  final int Radius;
  
  public Ball(int radius){
    this.Radius = radius;
  }
  
  public void draw(){
    fill(255);
    ellipse(Location.x, Location.y, Radius*2, Radius*2);
  }
  
  public void Move(){
    Location.add(Velocity);
  }
 
   public PVector GetLocation(){
     return Location;
   }
   
   public void SetSpeed(){
     Velocity = new PVector(0,0);
   }
 
}
