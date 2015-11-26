int numberBall;
Ball[] ballList;

void setup()
{
  size(500, 500);
  
  numberBall = 100;
  ballList = new Ball[numberBall];
  for(int i=0; i<numberBall; i++)
  {
    ballList[i] = new Ball();
  }
}

void draw()
{
  background(0);
  for(int i=0; i<ballList.length; i++)
  {
    ballList[i].run();
  }
}

void mousePressed()
{
  for(int i=0; i<ballList.length; i++)
  {
    ballList[i].updateShape();
  }
}