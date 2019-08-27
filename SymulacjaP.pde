import controlP5.*;

ControlP5 cp5;

String textValue = "";

void setup() {
  size(950, 750, P3D); 
  PFont font = createFont("arial",20);
  cp5 = new ControlP5(this);
  
  cp5.addTextfield("")
     .setPosition(830,30)
     .setSize(50,20)
     .setFont(font)
     .setColorBackground(255)
     .setColor(color(0,0,0))
     ;
  noStroke();
  fill(204, 204);
}

void draw() {  
  background(255);
  rect(720, 0, 230, height);
}
