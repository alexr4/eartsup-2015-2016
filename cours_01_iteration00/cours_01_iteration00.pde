void setup()
{
  size(500, 500);
}

void draw()
{
  background(0);
  
  stroke(255);
  for(int i = 0; i<width/50; i++)
  {
    line(i * 50, 0, i * 50, height);
  }
}