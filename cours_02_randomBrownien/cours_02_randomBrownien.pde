void setup()
{
  size(500, 500);
}

void draw()
{
  background(0);
  
  float x = random(0, width);
  ellipse(x, height/2, 50, 50);
}