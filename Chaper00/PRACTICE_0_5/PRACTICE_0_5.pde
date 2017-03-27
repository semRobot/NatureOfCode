// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Walker w;

void setup() {
  size(640,360);  //화면 사이즈 640, 360 픽셀
  // Create a walker object
  w = new Walker();  // Walker 객체 생성
  background(255);    // 배경화면 흰색 지정
}

void draw() {
  // Run the walker object
  w.step();    // w 객체의 위치 변경
  w.render();  // w 객체 그리기
}