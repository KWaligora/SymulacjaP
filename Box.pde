class Box{
  
  PMatrix2D Coordinates = new PMatrix2D();//box coordinate system
  PMatrix2D ReverseCoordinates = new PMatrix2D();//inverted coordinate system

  PVector ReversedTestPoint = new PVector();//allocate reversed point as vector
  PVector TestPoint = new PVector();//allocate regular point as vector
  PVector Origin;
  PVector Velocity;
  PVector Location;

  float w,h;//box width and height
  int Radius;
  boolean IsHovered;
  boolean FirstCollision;
  float Mass;
  float RotationSpeed;
  float Rotation;

  Box(float x, float y, float w,float h, int Radius){
    this.Location = new PVector(x,y);
    this.w = w;
    this.h = h;
    this.Radius = Radius;
    this.Velocity = new PVector(0,0);
    this.Origin = new PVector(0-w/2, 0-h/2);
    this.Mass = 0;
    this.RotationSpeed = 0;
    this.Rotation = 0;
    this.IsHovered = false;
    this.FirstCollision = true;
    
    this.Translate(Location.x, Location.y);
  }
  //whenever we update the regular coordinate system, we update the reversed one too
  void UpdateReverseCoordinates(){
    ReverseCoordinates = Coordinates.get();//clone the original coordinate system
    ReverseCoordinates.invert();//simply invert it
  }

  void Translate(float x, float y){
    Coordinates.translate(x, y);  
    UpdateReverseCoordinates();
  }
  void Rotate(float angle){
    Coordinates.rotate(angle); 
    UpdateReverseCoordinates();
  }
  
  boolean IsOver(float x,float y){
    ReversedTestPoint.set(0,0);//reset the reverse test point
    TestPoint.set(x,y);//set the x,y coordinates we want to test
    //transform the passed x,y coordinates to the reversed coordinates using matrix multiplication
    ReverseCoordinates.mult(TestPoint,ReversedTestPoint);
    //simply test the bounding box
    return ((ReversedTestPoint.x+radius >= Origin.x && ReversedTestPoint.x-radius <= w-w/2) && 
            (ReversedTestPoint.y+radius >= Origin.y && ReversedTestPoint.y-radius <= h-h/2));
        
  }
  void Update(float x,float y){
    IsHovered = IsOver(x,y);
  }
  
  void Move(){
    Coordinates.reset();
    if(Location.x >= 720 || Location.x <= 0 ) Velocity.x = 0;
    Location.add(Velocity);
    Rotation+=RotationSpeed;
    this.Translate(Location.x,Location.y);
    this.Rotate(radians(-Rotation));
  }
  
  public float GetMass(){
    return Mass;
  }
  
  public void SetMass(float m){
    Mass = m;
  }
  
  public boolean GetIsHovered(){
    return IsHovered;
  }
  
 public void OnCollision(float SpeedBall, float MassBall){
   float speed;
     if(FirstCollision){
       FirstCollision = false;
       speed = SpeedBall*2*MassBall/(4*MassBall+Mass);
       RotationSpeed = (6/(h/100)) * ((2 * MassBall)/(4*MassBall+Mass))*SpeedBall;
       Rotation = RotationSpeed;
     }
     else {
       speed = 0;       
       RotationSpeed = 0;
     }
     Velocity.set(speed,0);
      
   }
  
  void Draw(){
    Move();
    pushMatrix();
    applyMatrix(Coordinates);
    fill(255);
    rect(Origin.x, Origin.y, w, h);
    popMatrix();
  }
}
