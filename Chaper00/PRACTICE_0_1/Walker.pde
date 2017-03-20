// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A random walker object!

class Walker {
  int x,y;

  Walker() {          // 생성자
    x = width/2;      // x 초기 위치 가로 폭의 절반
    y = height/2;     // y 초기 위치 세로 높이의 절반
  }

  void render() {
    stroke(0);        // 테두리 선 색 black
    point(x,y);        // x,y 에 점을 찍는다
  }

  // Randomly move up, down, left, right, or stay in one place
  void step() {
    
    float choice = random(1);    // 0.0 ~ 1.0 까지의 난수 발생
    
    // 난수에 따라 x,y 좌표 변경
    if (choice < 0.3) {
      x++;          // 오른쪽으로 이동
    } else if (choice < 0.5) {
      x--;
    } else if (choice < 0.8) {
      y++;
    } else {
      y--;          //아래로 이동
    }

    x = constrain(x,0,width-1);    // limit : 0 ~ width-1
    y = constrain(y,0,height-1);  // limit : 0 ~ height -1
  }
}