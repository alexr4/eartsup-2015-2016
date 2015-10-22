void setup()
{
  size(500, 500);
}

void draw()
{
  background(0);
  
  float x = random(0, width);
  float y = random(0, height);
  ellipse(x, y, 50, 50);
}