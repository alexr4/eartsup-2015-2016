void setup()
{
  size(500, 500, P3D);
  colorMode(HSB, 360, 100, 100);
}

void draw()
{
  background(0);
  
  beginShape();
  noFill();
  strokeWeight(5);
  for(int i=0; i<10; i++)
  {
    float phi = map(i, 0, 10, 0, TWO_PI);
    float hue = map(i, 0, 10, 0, 360);
    float radius = random(100, 200);
    float x = width/2 + cos(phi) * radius;
    float y = height/2 + sin(phi) * radius;
    stroke(hue, 100, 100);
    vertex(x, y);
  }
  endShape(CLOSE);
}