import controlP5.*;

ControlP5 cp5;

String textValue = "";

void setup() {
  size(950, 750, P3D); 
  PFont font = createFont("arial",14);
  cp5 = new ControlP5(this);
  
  cp5.addTextfield("input")
     .setPosition(830,30)
     .setSize(50,20)
     .setFont(font)
     .setColorBackground(color(255,255,255))
     .setColor(color(0,0,0))
     .setColorCaptionLabel(color(209, 209, 209))
     ;
     
      cp5.addBang("Start")
     .setPosition(760,180)
     .setSize(150,30)
     .setFont(font)
     .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
     ;
     
     cp5.addBang("Reset")
     .setPosition(760, 230)
     .setSize(150,30)
     .setFont(font)
     .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
     ;  
     
  noStroke();
  fill(204, 204);
}

void draw() {  
  background(255);
  rect(720, 0, 230, height);
  fill(color(209, 209, 209));
  textValue = cp5.get(Textfield.class,"input").getText();
}
