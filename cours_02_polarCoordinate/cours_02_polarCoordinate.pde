float radius = 150;
int nbPoint = 8;
float resolution = TWO_PI / 8;

float motionRadius = 200;
float eta = 0;
float speedEta = radians(2);

void setup()
{
  size(500, 500);
}

void draw()
{
  background(255);

  pushMatrix();
  translate(width/2, height/2);
  float angle = radians(45);
  rotate(angle);
  fill(0, 0, 255);
  rectMode(CENTER);
  rect(0, 0, 150, 150);
  popMatrix();

  for (float i = 0; i < TWO_PI; i+=resolution)
  {
    float x = width/2 + cos(i) * radius;
    float y = height/2 + sin(i) * radius;

    fill(0, 255, 0);
    noStroke();
    ellipse(x, y, 20, 20);
  }
  
  float x = width/2 + cos(eta) * motionRadius;
  float y = height/2 + sin(eta) * motionRadius;
  eta += speedEta;
  fill(255, 0, 0);
  ellipse(x, y, 20, 20);
}