

void setup()
{
  size(500, 500);
  background(0);
}

void draw()
{
  
  background(0);
  
  float median = width/2;
  float deviation = 50;
  float x = (randomGaussian() * deviation) + median;
  
  noStroke();
  fill(255);
  ellipse(x, height/2, 50, 50);
  
}