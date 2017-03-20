// 2017.03.20
// random으로 난수 발생시 각 변수의 발생 빈도를 그래프로 표현
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// An array to keep track of how often random numbers are picked
float[] randomCounts;

void setup() {
  size(640,360);
  randomCounts = new float[20];    //배열 20 개
}

void draw() {
  background(255);
  
  // Pick a random number and increase the count
  int index = int(random(randomCounts.length));    // == int(random(20));
  randomCounts[index]++;                           
  
  // Draw a rectangle to graph results
  stroke(0);      //테두리 선 black
  strokeWeight(2);//테두리선 두께 2
  fill(127);      //채우기 127 회색
  
  int w = width/randomCounts.length;
  
  for (int x = 0; x < randomCounts.length; x++) {
    rect(x*w,height-randomCounts[x],w-1,randomCounts[x]);    // 사각형 그리기 x,y,w,h
  } 
}