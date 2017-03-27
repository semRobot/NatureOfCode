// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Forces (Gravity and Fluid Resistence) with Vectors 

// Demonstration of multiple force acting on bodies (Mover class)
// Bodies experience gravity continuously
// Bodies experience fluid resistance when in "water"

// Five moving bodies
Mover[] movers = new Mover[9];

// Liquid
Liquid liquid;

void setup() {
  size(640, 360);
  reset();
  // Create liquid object
  liquid = new Liquid(0, 0, width, height, 0.01);
}

void draw() {
  background(255);

  // Draw water
  liquid.display();

  for (int i = 0; i < movers.length; i++) {

    // Is the Mover in the liquid?
    if (liquid.contains(movers[i])) {
      // Calculate drag force
      PVector dragForce = liquid.drag(movers[i]);
      // Apply drag force to Mover
      movers[i].applyForce(dragForce);
      
    }

    // Gravity is scaled by mass here!
    PVector gravity = new PVector(0, 0.1*movers[i].mass);
    PVector wind = new PVector(0.1, 0);
    float speed = movers[i].velocity.mag();
    float area = movers[i].getArea();   
    speed *= -0.05;  //임의의 상수, 중력 반대방향
    PVector inducedLift = new PVector(0, speed*movers[i].mass);
    inducedLift.limit(0.2);
    // Apply gravity
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    movers[i].applyForce(inducedLift);

    // Update and display
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }

  fill(0);
  text("click mouse to reset", 10, 30);
}

void mousePressed() {
  reset();
}

// Restart all the Mover objects randomly
void reset() {
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.5, 3), 0, height-50);
  }
}