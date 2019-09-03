class Ball{
  int Velocity = 0;
  int Mass = 0;
  PVector Location = new PVector(650, 485);
  final int Width = 35;
  
  public void Draw(){
    fill(255);
    ellipse(Location.x, Location.y, Width, Width);
  }
}
