void setup()
{
  size(500, 500);
}

void draw()
{
  background(0);
  
  if(mouseX > width/2 && mouseY > height/2)
  {
    fill(0, 0, 255);
  }
  else
  {
    fill(255);
  }
  
  ellipse(width/2, height/2, 250, 250);
}