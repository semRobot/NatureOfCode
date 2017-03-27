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
    int red, green, blue;
    float color1 = (float)generator.nextGaussian();
    float color2 = (float)generator.nextGaussian();
    float color3 = (float)generator.nextGaussian();
    float sd = 255 / 2;
    float mean = 255 /2;
    
    color1 = color1 * sd + mean;
    color2 = color2 * sd + mean;
    color3 = color3 * sd + mean;
    
    constrain(color1, 0, 255);
    constrain(color2, 0, 255);
    constrain(color3, 0, 255);
    
    red = (int)color1;
    green = (int)color2;
    blue = (int)color3;
    
    strokeWeight(4);                  // 점 두께 조정
    stroke(red, green, blue);        // 점 색상 변경 , rgb,alpha
    point(x,y);        // x,y 에 점을 찍는다
  }

  // Randomly move up, down, left, right, or stay in one place
  void step() {
    
    float gaussianValue1 = (float)generator.nextGaussian();
    float gaussianValue2 = (float)generator.nextGaussian();
    float sd = 50;
    float mean = 0;
    
    gaussianValue1 = gaussianValue1 * sd + mean;
    gaussianValue2 = gaussianValue2 * sd + mean;
    
    x = (int)gaussianValue1 + width/2;
    y = (int)gaussianValue2 + height/2;

    x = constrain(x,0,width-1);    // limit : 0 ~ width-1
    y = constrain(y,0,height-1);  // limit : 0 ~ height -1
  }
}