void setup()
{
  size(500, 500);
}

void draw()
{
  background(255);
  
  pushMatrix();
  translate(width/2, height/2);
  float angle = radians(20);
  
  rotate(angle);
  fill(0, 0, 255);
  rectMode(CENTER);
  rect(0, 0, 150, 150);
  popMatrix();
  
  fill(255, 0, 0);
  rect(20, 20, 50, 50);
}