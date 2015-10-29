float margin = 100;

void setup()
{
  size(500, 500, P3D);
}

void draw()
{
  background(200);

  beginShape();
  noFill();
  for (int i=0; i< 10; i++)
  {
    float eta = map(i, 0, 10, 0, TWO_PI);
    float redvalue = map(i, 0, 10, 0, 255);
    float x = width/2 + sin(eta) * 200;
    float y = height/2 + cos(eta) * 200;
    fill(redvalue, 0, 0);
    vertex(x, y);
  }
  endShape(CLOSE);
}