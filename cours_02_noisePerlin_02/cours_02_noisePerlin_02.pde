float perlinNoiseX;
float perlinOffsetX;
float perlinNoiseY;
float perlinOffsetY;

void setup()
{
  size(500, 500);
  perlinNoiseX = 0;
  perlinOffsetX = 0.01;
  perlinNoiseY = 0;
  perlinOffsetY = 0.025;
}

void draw()
{
  background(0);
  
  float x = noise(perlinNoiseX) * width;
  float y = noise(perlinNoiseY) * height;
  ellipse(x, y, 50, 50);
  
  perlinNoiseX += perlinOffsetX;
  perlinNoiseY += perlinOffsetY;
}