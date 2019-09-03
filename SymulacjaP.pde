import controlP5.*;

ControlP5 cp5;

String textValue = "";

void setup() {
  size(950, 750, P3D); 
  cp5 = new ControlP5(this);
  CreateFront();
}

void draw() {  
  background(255);
  noStroke();
  fill(color(209, 209, 209));
  rect(720, 0, 230, height);
  DrawRectangle();
}

public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
}

public void Start() {
}

public void CreateFront(){
  PFont font = createFont("arial",14);
  cp5.addTextlabel("Label1")
                    .setText("Masa Pręta")
                    .setPosition(720,30)
                    .setColorValue(0)
                    .setFont(font)
                    ;
  
  cp5.addTextfield("MassBar")
     .setPosition(830,30)
     .setSize(50,20)
     .setFont(font)
     .setColorBackground(color(255,255,255))
     .setColor(color(0,0,0))
     .setColorCaptionLabel(color(209, 209, 209))
     ;
     
      cp5.addTextlabel("label2")
                    .setText("Masa Kulki")
                    .setPosition(720,80)
                    .setColorValue(0)
                    .setFont(font)
                    ;   
     
       cp5.addTextfield("MassBall")
     .setPosition(830,80)
     .setSize(50,20)
     .setFont(font)
     .setColorBackground(color(255,255,255))
     .setColor(color(0,0,0))
     .setColorCaptionLabel(color(209, 209, 209))
     ;
     
      cp5.addTextlabel("label3")
                    .setText("Prędkośc kulki")
                    .setPosition(720,130)
                    .setColorValue(0)
                    .setFont(font)
                    ;
     
       cp5.addTextfield("SpeedBall")
     .setPosition(830,130)
     .setSize(50,20)
     .setFont(font)
     .setColorBackground(color(255,255,255))
     .setColor(color(0,0,0))
     .setColorCaptionLabel(color(209, 209, 209))
     ;
     
      cp5.addButton("Start")
     .setPosition(760,180)
     .setSize(150,30)
     ;
     
     cp5.addButton("Reset")
     .setPosition(760,230)
     .setSize(150,30)
     ; 
}
