float x;
float y;
float easing;

void setup()
{
  size(500, 500);
  
  easing = random(1);
}

void draw()
{
  background(0);
  
  updateLocation();
  ellipse(x, y, 40, 40);
}

void updateLocation()
{
  float targetX = mouseX;
  float targetY = mouseY;
  
  float dx = targetX - x;
  x += dx * easing;
  
  float dy = targetY - y;
  y += dy * easing;
  
  println(targetX, dx, x, targetY, dy, y);
}

void mousePressed()
{
  easing = random(1);
}