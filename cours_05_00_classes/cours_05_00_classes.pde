Ball ball00;
Ball ball01;

void setup()
{
  size(500, 500);
  ball00 = new Ball();
  ball01 = new Ball();
}

void draw()
{
  background(0);
  ball00.run();
  ball01.run();
}

void mousePressed()
{
  ball00.updateShape();
  ball01.updateShape();
}