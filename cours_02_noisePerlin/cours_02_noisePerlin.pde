float perlinNoise;
float perlinOffset;

void setup()
{
  size(500, 500);
  perlinNoise = 0;
  perlinOffset = 0.01;
}

void draw()
{
  background(0);
  
  float x = noise(perlinNoise) * width;
  println(x);
  ellipse(x, height/2, 50, 50);
  
  perlinNoise += perlinOffset;
}