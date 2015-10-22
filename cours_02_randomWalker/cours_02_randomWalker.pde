float size;

//browien
float brownX;
float brownY;

//perlin
float perlX;
float perlY;
float perlinNoiseX;
float perlinNoiseY;
float offsetX;
float offsetY;

//Gaussian
float gaussX;
float gaussY;
float deviationX;
float deviationY;
float medianX;
float medianY;

void setup()
{
  size(900, 900);
  
  size = 25;
  //perlin
  offsetX = 0.001;
  offsetY = 0.01;
  
  //gaussian
  deviationX = 50;
  deviationY = 150;
  medianX = width/2;
  medianY = height/2;
  
  background(0);
}

void draw()
{
  //brownien
  brownX = random(0, width);
  brownY = random(0, height);
  noStroke();
  fill(255, 0, 0);
  ellipse(brownX, brownY, size, size);
  
  //perlin
  perlX = noise(perlinNoiseX) * width;
  perlY = noise(perlinNoiseY) * height;
  perlinNoiseX += offsetX;
  perlinNoiseY += offsetY;
  fill(0, 0, 255);
  ellipse(perlX, perlY, size, size);
  
  //gaussian
  gaussX = (randomGaussian() * deviationX) + medianX;
  gaussY = (randomGaussian() * deviationY) + medianY;
  fill(0, 255, 0);
  ellipse(gaussX, gaussY, size, size);
}