float marginX = 50;
float marginY = 100;
float departX = 20;
float departY = 20;

void setup()
{
  size(500, 500);
}

void draw()
{
  background(0);
  noStroke();
  for (int i = 0; i<width/marginX; i++)
  {
    for (int j = 0; j<height/marginY; j++)
    {
      if (i % 2 == 0)
      {
        fill(255, 0, 0);
      } else
      {
        fill(0, 0, 255);
      }
      ellipse(departX + i*marginX, departY + j*marginY, 20, 20);
    }
  }
}