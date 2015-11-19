Timer monChrono;

void setup()
{
  size(500, 500);
  monChrono = new Timer(5000);
  monChrono.start();
}

void draw()
{
  background(255);

  if (monChrono.isFinished() == false)
  {
    float tempsRestant = monChrono.getRemainingTime();
    println("Temps Restant : "+tempsRestant);
    
    if(tempsRestant <= 3000)
    {
      textAlign(CENTER);
      fill(0, 0, 255);
      textSize(32);
      text(tempsRestant, width/2, height/2);
    }
    
  }
  else
  {
    fill(255, 0, 0);
    ellipse(width/2, height/2, 500, 500);
    
    //monChrono.reset();
    //monChrono.start();
  }
}