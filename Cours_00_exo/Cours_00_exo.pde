color couleurDeFond = color(96, 193, 222); //couleur de fond

float globalX;
float globalY;

float eyeSize = 40;
color eyeColor = color(0);
float eyeRightX;
float eyeRightY;
float eyeLeftX;
float eyeLeftY;
float eyeRightMargin = 20;
float eyeLeftMargin = 5;
char eye = '^';

float bodyWidth = 250;
float bodyHeight = 500;
float bodyX;
float bodyY;
color bodyColor = color(250, 218, 56);


void setup()
{
  fullScreen();
}

void draw()
{
  background(couleurDeFond);
  
  globalX = mouseX;
  globalY = mouseY;
  bodyX = globalX;
  bodyY= globalY;
  eyeRightX = globalX + bodyWidth/2;
  eyeRightY = globalY - bodyHeight/2 - eyeRightMargin;
  eyeLeftX = globalX - bodyWidth/2;
  eyeLeftY = globalY - bodyHeight/2 - eyeLeftMargin;
  
  noStroke();
  fill(bodyColor);
  rectMode(CENTER);
  rect(bodyX, bodyY, bodyWidth, bodyHeight);
  
  fill(eyeColor);
  textAlign(CENTER);
  textSize(eyeSize);
  text(eye, eyeRightX, eyeRightY);
  text(eye, eyeLeftX, eyeLeftY);
}