float y;
float x;
float limit;
void setup()
{
  size(500, 500);
  x =0;
  y = height/2;
  limit = 500;
}

void draw()
{
  background(255);
  x = frameCount;
  stroke(0);
  line(0, y, x, y);
  if(x > limit)
  {
    fill(0);
    textAlign(CENTER);
    text("fin", width/2, y - 20);
    noLoop();
  }
  else
  {
    fill(0);
    textAlign(CENTER);
    text("frame : "+frameCount+" fps : "+round(frameRate), width/2, y - 20);
  }
}