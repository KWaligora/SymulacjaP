class Box{
  
  PMatrix2D coordinates = new PMatrix2D();//box coordinate system
  PMatrix2D reverseCoordinates = new PMatrix2D();//inverted coordinate system

  PVector reversedTestPoint = new PVector();//allocate reversed point as vector
  PVector testPoint = new PVector();//allocate regular point as vector
  PVector origin;
  PVector Velocity;
  PVector Location;

  float w,h;//box width and height
  int radius;
  boolean isHovered;
  float Mass;

  Box(float x, float y, float w,float h, int radius){
    this.Location = new PVector(x,y);
    this.w = w;
    this.h = h;
    this.radius = radius;
    this.Velocity = new PVector(0,0);
    this.origin = new PVector(0-w/2, 0-h/2);
    this.Mass = 0;
    
    this.translate(Location.x, Location.y);
  }
  //whenever we update the regular coordinate system, we update the reversed one too
  void updateReverseCoordinates(){
    reverseCoordinates = coordinates.get();//clone the original coordinate system
    reverseCoordinates.invert();//simply invert it
  }

  void translate(float x, float y){
    coordinates.translate(x, y);  
    updateReverseCoordinates();
  }
  void rotate(float angle){
    coordinates.rotate(angle); 
    updateReverseCoordinates();
  }
  
  boolean isOver(float x,float y){
    reversedTestPoint.set(0,0);//reset the reverse test point
    testPoint.set(x,y);//set the x,y coordinates we want to test
    //transform the passed x,y coordinates to the reversed coordinates using matrix multiplication
    reverseCoordinates.mult(testPoint,reversedTestPoint);
    //simply test the bounding box
    return ((reversedTestPoint.x+radius >= origin.x && reversedTestPoint.x-radius <= w-w/2) && 
            (reversedTestPoint.y+radius >= origin.y && reversedTestPoint.y-radius <= h-h/2));
        
  }
  void update(float x,float y){
    isHovered = isOver(x,y);
  }
  
  void move(){
    coordinates.reset();
    Location.add(Velocity);
    this.translate(Location.x,Location.y);
    this.rotate(0);
     //this.origin = new PVector(0-Location.x-w/2, 0-Location.y-h/2);
   // this.translate(Location.x, Location.y);
  }
  
  public void SetMass(float m){
    Mass = m;
  }
  
  void draw(){
      if(isHovered) fill(127);
      else          fill(255);
      move();
    pushMatrix();
    applyMatrix(coordinates);
    rect(origin.x, origin.y, w, h);
    popMatrix();
      move();
  }
}
