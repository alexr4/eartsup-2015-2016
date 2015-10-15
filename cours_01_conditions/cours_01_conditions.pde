void setup()
{
  size(500, 500);
}

void draw()
{
  background(0);
  if(mouseX > width/2 + 50)
  {
    rectMode(CENTER);
    rect(width/2, height/2, 250, 250);
  }
  else if(mouseX < width/2 - 50){
    ellipse(width/2, height/2, 250, 250);
  }
  else
  {
    println("YA RIEN!!!!");
  }
}