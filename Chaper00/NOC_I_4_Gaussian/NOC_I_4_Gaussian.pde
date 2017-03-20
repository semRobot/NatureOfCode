// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

void setup() {
  size(640, 360);
  background(255);
}

void draw() {

  // Get a gaussian random number w/ mean of 0 and standard deviation of 1.0
  float xloc = randomGaussian();      // 가우시안 분포에서 값을 추출

  float sd = 30;                // 표준편차 Define a standard deviation
  float mean = width/2;         // 화면 가운데  Define a mean value (middle of the screen along the x-axis)
  xloc = ( xloc * sd ) + mean;  // Scale the gaussian random number by standard deviation and mean

  fill(0, 10);    // arg1 : gray, arg1 : alpha
  noStroke();      // 테두리 없음
  ellipse(xloc, height/2, 16, 16);   // Draw an ellipse at our "normal" random position
}