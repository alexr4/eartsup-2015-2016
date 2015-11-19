Timer monTimer;
float taille;

void setup()
{
  size(800, 400, P2D);
  monTimer = new Timer(5000);
  monTimer.start();
}

void draw()
{
  background(0);

  if (monTimer.isFinished())
  {
    monTimer.start();
  }

  taille = map(monTimer.getRemainingTime(), 0, monTimer.totalTime, 100, 300);
  
  noFill();
  stroke(255);
  ellipse(width/2, height/2, taille, taille);
  
  fill(255);
  textAlign(CENTER);
  text(monTimer.getRemainingTime(), width/2, height/2);

  //println(monTimer.getRemainingTime());
}