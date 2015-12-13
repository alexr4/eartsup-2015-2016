class Square
{
  float x;
  float y;
  float squareWidth;
  float squareHeight;
  color squareColor;

  Square(float x_, float y_)
  {
    x = x_;
    y = y_;
    squareWidth = 10;
    squareHeight = 10;
    squareColor = color(random(255), random(255), random(255));
  }

  void run()
  {
    display();
  }
  
  void display()
  {
    pushMatrix();
    translate(x, y);
    rotate(radians(45));
    rectMode(CENTER);
    rect(0, 0, squareWidth, squareHeight);
    popMatrix();
  }
}