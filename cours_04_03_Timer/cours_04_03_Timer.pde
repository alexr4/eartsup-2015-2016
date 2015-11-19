Timer monTimer;
int tempsTimer;
int compteurDeTours;
color colorShape;
float x;
float y;

void setup()
{
  size(500, 500);
  x = width/2;
  y = height/2;
  colorShape = color(random(255), random(255), random(255));
  compteurDeTours = 0;
  tempsTimer = 2500;
  monTimer = new Timer(tempsTimer);
  monTimer.start();
}

void draw()
{
  background(255);
  fill(colorShape);
  noStroke();
  if (compteurDeTours % 2 == 0)
  {
    rectMode(CENTER);
    rect(x, y, 400, 400);
  } else
  {
    ellipseMode(CENTER);
    ellipse(x, y, 400, 400);
  }

  if (monTimer.isFinished())
  {
    colorShape = color(random(255), random(255), random(255));
    compteurDeTours ++;
    monTimer.totalTime = round(random(1000, 4000));
    monTimer.reset();
    monTimer.start();
  } else
  {
    println(monTimer.getRemainingTime());
  }
}