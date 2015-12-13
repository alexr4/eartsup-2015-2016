import ddf.minim.*;

Minim minim;
AudioPlayer player;

float x;
float y;
float ellipseWidth;
float ellipseHeight;
color ellipseColorOn;
color ellipseColorOff;
boolean onAir;

void setup()
{
  size(500, 500);
  
  minim = new Minim(this);//contexte de l'application
  player = minim.loadFile("07-Chords_Sh-Boom.mp3");//chargement du fichier

  x = width/2;
  y = height/2;
  ellipseWidth = 200;
  ellipseHeight = 200;
  ellipseColorOn = color(255, 0, 0);
  ellipseColorOff = color(0, 255, 0);
  onAir = false;
}

void draw()
{
  background(0);
  noStroke();
  if(onAir == true)
  {
    fill(ellipseColorOn);
  }
  else
  {
    fill(ellipseColorOff);
  }
  ellipse(x, y, ellipseWidth, ellipseHeight);
}

void keyPressed()
{
  if(onAir == false)
  {
    player.play();
    onAir = true;
  }
  else
  {
    player.pause();
    player.rewind();
    onAir = false;
  }
}