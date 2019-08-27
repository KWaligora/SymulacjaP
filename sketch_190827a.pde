float a = 0.0;
float rSize;  // rectangle size

void setup() {
  size(950, 750, P3D);
  rSize = width / 12;  
  noStroke();
  fill(204, 204);
}

void draw() {  
  background(255);
  rect(720, 0, 230, height);
}
