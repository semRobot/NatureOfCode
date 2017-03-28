// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Forces (Gravity and Fluid Resistence) with Vectors 

// Demonstration of multiple force acting on bodies (Mover class)
// Bodies experience gravity continuously
// Bodies experience fluid resistance when in "water"

import controlP5.*;


// Five moving bodies
Mover movers;
ControlP5 cp5;

// Liquid
Liquid liquid;
PVector thrust;
boolean isEnable = true;

void setup() {
  size(640, 360);
  
  setupGui();     
  
  reset();
  // Create liquid object
  liquid = new Liquid(0, 0, width, height, 0.01);
  thrust = new PVector(0,0);
}

void draw() {
  if(isEnable == false) return;
  
  background(255);

  // Draw water
  liquid.display();
  PVector dragForce = new PVector(0,0);
  PVector lift = new PVector(0,0);
    // Is the Mover in the liquid?
    if (liquid.contains(movers)) {
      dragForce = new PVector(0,0);
      lift = new PVector(0,0);
      // Calculate drag force
      dragForce = liquid.drag(movers);
      lift = liquid.lift(movers);

      // Apply drag force to Mover
      movers.applyForce(dragForce);
      movers.applyForce(lift.mult(movers.getAngle()));
      
    }

    // Gravity is scaled by mass here!
    PVector gravity = new PVector(0, 0.1*movers.mass);

    // Apply gravity
    movers.applyForce(thrust);
    movers.applyForce(gravity);

    // Update and display
    movers.update();
    movers.display();
    movers.checkEdges();
    
    // DEBUG GUI
    fill(255);
    ellipse(100,100,100,100);
    ellipse(300,100,100,100);
    text("Force List",75,170);
    text("Total Force",265,170);
    stroke(0,0,255);
    line(100, 100, 100 + thrust.x*200, 100 + thrust.y*200);  
    stroke(0,255,0);
    gravity.div(movers.mass);   // mass를 곱했기 때문에 다시 mass 를 나눔
    line(100, 100, 100 + gravity.x*200, 100 + gravity.y*200);  
    stroke(255,0,0);
    line(100, 100, 100 + dragForce.x*200, 100 + dragForce.y*200); 
    stroke(190,0,255);
    line(100, 100, 100 + lift.x*200, 100 + lift.y*200);    
        
    PVector positiveForce = PVector.add(thrust,lift);
    PVector negativeForce = PVector.add(gravity,dragForce);
    PVector totalForce = PVector.add(positiveForce,negativeForce);
    stroke(255,0,0);
    line(300, 100, 300 + totalForce.x*200, 100 + totalForce.y*200);       
}

void mousePressed() {
  //reset();
}

// Restart all the Mover objects randomly
void reset() {
    movers = new Mover(0, height-50, random(0.5, 3), radians(-15)); 
}

public void init() {
  String angle = cp5.get(Textfield.class,"angle").getText();
  String force = cp5.get(Textfield.class,"thrust").getText();
  thrust.set(float(force),0);
  movers = new Mover(0, height-50, random(0.5, 3), radians(float(angle))); 
}

public void stop() {
  isEnable = false;
}

public void resume() {
  isEnable = true; 
}

void setupGui()
{
  PFont font = createFont("arial",14);
  
  cp5 = new ControlP5(this);
  
  cp5.addTextfield("angle")
     .setPosition(450,10)
     .setSize(50,20)
     .setFont(font)
     .setFocus(true)
     .setColor(color(200,200,200))
     ;
     
  cp5.addTextfield("thrust")
     .setPosition(510,10)
     .setSize(50,20)
     .setFont(font)
     .setFocus(true)
     .setColor(color(200,200,200))
     ;
     
  cp5.addBang("init")
    .setPosition(580,10)
    .setSize(50,20)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
    ;
    
  cp5.addBang("stop")
    .setPosition(580,40)
    .setSize(50,20)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
    ; 
    
  cp5.addBang("resume")
    .setPosition(580,70)
    .setSize(50,20)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
    ;
}