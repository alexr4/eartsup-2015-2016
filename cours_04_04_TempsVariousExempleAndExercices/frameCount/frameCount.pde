
//Limit de frame
int maxFrame;
int actualFrame;

//Taille Max de la ligne
float maxWidth;
float actualWidth;


void setup()
{
  size(800, 400, P2D);
  
  maxFrame = 1200;
  actualFrame = frameCount;
  maxWidth = width;
  actualWidth = 0;
}

void draw()
{
  background(0);
  actualFrame = frameCount;
  
  if (actualFrame <= maxFrame)
  {
    actualWidth = map(actualFrame, 0, maxFrame, 0, maxWidth);
  }
  else
  {
    noLoop();
  }
  
  stroke(255);
  line(0, height/2, actualWidth, height/2);
  
  println("nombre total de frame : "+frameCount);
  println("FrameRate : "+frameRate);
}