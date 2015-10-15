float distanceEntreDeuxLignes = 10.75;

void setup()
{
  size(500, 500);
}

void draw()
{
  background(0);
  distanceEntreDeuxLignes = 1 + mouseX;
  stroke(255);
  for(int i = 0; i<width/distanceEntreDeuxLignes; i++)
  {
    line(i * distanceEntreDeuxLignes, 0, i * distanceEntreDeuxLignes, height);
  }
}