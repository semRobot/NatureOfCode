// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A random walker object!
import java.util.Random;

class Walker {
  int x,y;
  Random generator;

  Walker() {          // 생성자
    x = width/2;      // x 초기 위치 가로 폭의 절반
    y = height/2;     // y 초기 위치 세로 높이의 절반
    
    generator = new Random();
  }

  void render() {
    strokeWeight(4);
    stroke(0);        // 테두리 선 색 black
    point(x,y);        // x,y 에 점을 찍는다
  }

  // Randomly move up, down, left, right, or stay in one place
  void step() {
    
    float deltaX = (float)generator.nextGaussian();
    float deltaY = (float)generator.nextGaussian();
    float sd = 10;
    x += (int)(deltaX * sd);
    y += (int)(deltaY * sd);

    x = constrain(x,0,width-1);    // limit : 0 ~ width-1
    y = constrain(y,0,height-1);  // limit : 0 ~ height -1
  }
}