// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  // position, velocity, and acceleration 
  PVector position;
  PVector velocity;
  PVector acceleration;

  // Mass is tied to size
  float mass;
  float rectWidth;
  float heading;

  Mover(float m, float x, float y) {
    mass = m;
    rectWidth = mass*16;
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  // Newton's 2nd law: F = M * A
  // or A = F / M
  void applyForce(PVector force) {
    // Divide by mass 
    PVector f = PVector.div(force, mass);
    // Accumulate all forces in acceleration
    acceleration.add(f);
  }

  void update() {

    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // position changes by velocity
    position.add(velocity);
    // We must clear acceleration each frame
    acceleration.mult(0);
  }

  // Draw Mover
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127, 200);
    rectMode(CENTER);
    //ellipse(position.x, position.y, mass*16, mass*16);
    pushMatrix();
    translate(position.x, position.y);
    rotate(-PI/6);
    rect(-rectWidth/2,-rectWidth/2,rectWidth,10);
    popMatrix();
  }

  // Bounce off bottom of window
  void checkEdges() {
    if (position.y > height) {
      velocity.y *= -0.9;  // A little dampening when hitting the bottom
      position.y = height;
    }
  }
    // Get Area
  float getArea()
  {
    float area = rectWidth;
    return area;
  }
}