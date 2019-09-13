class Ball{
  float Mass;
  PVector Location;
  PVector Velocity;
  final int Radius;
  
  public Ball(int radius){
    Location = new PVector(650, 435);
    Velocity = new PVector(0,0);
    this.Radius = radius;
    Mass = 1;
    
    fill(255);
    ellipse(Location.x, Location.y, Radius*2, Radius*2);
  }
  
  public void Draw(){
    Location.add(Velocity);
    fill(255);
    ellipse(Location.x, Location.y, Radius*2, Radius*2);
  }
 
   public PVector GetLocation(){
     return Location;
   }
   
   public float GetSpeed(){
     return Velocity.x;
   }
   
   public void SetSpeed(float speed){
     Velocity.set(-speed, 0);
   }
   
   public float GetMass(){
     return Mass;
   }
   
   public void SetMass(float mass){
     Mass = mass;
   }
   
   public void OnCollision(){
   }
}
