float speedX;
float speedY;
float x;
float y;
float radius;

void setup()
{
  size(500, 500);
  radius = 20;
  speedX = random(5);
  speedY = random(5);
  
  x = random(radius, width-radius);
  y = random(radius, height-radius);
}

void draw()
{
  background(0);
  
  updateLocation();
  checkEdge();
  ellipse(x, y, radius * 2, radius * 2);
}

void updateLocation()
{
  x += speedX;
  y += speedY;
}

void checkEdge()
{
  if(x > width - radius || x < 0 + radius)
  {
    speedX *= -1;
  }
  
  if(y > height - radius || y < 0 + radius)
  {
    speedY *= -1;
  }
}