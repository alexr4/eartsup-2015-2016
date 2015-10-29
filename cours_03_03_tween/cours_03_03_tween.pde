S
float time = 0.0;
float duration = 60;
float sx = 150;
float ex = 0;
float sy = 150;
float ey = 0;

void setup()
{
  size(500, 500);
}

void draw()
{
  /*
  background(0);
  */
  noStroke();
  fill(0, 5);
  rect(0,0,width, height);

  float x  = inoutExp(time, sx, ex, duration);
  float y  = inoutExp(time, sy, ey, duration);

  println(time, duration, sx, ex, x, sy, ey, y);
  if (time > duration)
  {
  } else
  {
    time ++;
  }
  
  fill(255);
  ellipse(x, y, 20, 20);
}

void mousePressed()
{
  time = 0.0;
  sx = ex;
  ex = mouseX;
  sy = ey;
  ey = mouseY;
}