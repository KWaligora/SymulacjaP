class Box{
  
  PMatrix2D coordinates = new PMatrix2D();//box coordinate system
  PMatrix2D reverseCoordinates = new PMatrix2D();//inverted coordinate system

  PVector reversedTestPoint = new PVector();//allocate reversed point as vector
  PVector testPoint = new PVector();//allocate regular point as vector
  PVector origin = new PVector();

  float w,h;//box width and height
  int radius;
  boolean isHovered;

  Box(float w,float h, int radius){
    this.w = w;
    this.h = h;
    this.radius = radius;
    this.origin = new PVector(0-w/2, 0-h/2);
  }
  //whenever we update the regular coordinate system, we update the reversed one too
  void updateReverseCoordinates(){
    reverseCoordinates = coordinates.get();//clone the original coordinate system
    reverseCoordinates.invert();//simply invert it
  }

  void translate(float x,float y){
    coordinates.translate(x,y);  
    updateReverseCoordinates();
  }
  void rotate(float angle){
    coordinates.rotate(angle); 
    updateReverseCoordinates();
  }
  void scale(float s){
    coordinates.scale(s);
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
  void draw(){
      if(isHovered) fill(127);
      else          fill(255);
    pushMatrix();
    applyMatrix(coordinates);
    rect(origin.x, origin.y, w, h);
    popMatrix();
  }
}
