/*
La valeur sinus d'un angle compris entre 0 et 360 degrées sera comprise
 entre -1 et 1
 */

float margin; //marge de la ligne
float xOffset; //distance entre les points de ma ligne sin
float lineWidth; //taille de la ligne

float phi; //angle de départ
float speedPhi;
float speedPhiPerElement; //vitesse de l'ange
float periode; //duree de l'angle
float amplitude; //amplitude de la ligne

float[] yList; //liste des valeurs y des points de la ligne
int yMax; //nombre d'element dans le tableau de valeur

void setup()
{
  size(500, 500);

  margin = 50;
  xOffset = 10;
  lineWidth = width - (margin *2);

  periode = 250;
  speedPhi = TWO_PI/periode;
  speedPhiPerElement = speedPhi * xOffset;
  amplitude = 100;

  yMax = round(lineWidth/xOffset);
  yList = new float[yMax];
}

void draw()
{
  background(0);

  updateWave();
  noStroke();
  fill(255);
  for (int i=0; i<yList.length; i++)
  {
    float x = margin + i * xOffset;
    float y = height/2 + yList[i];
    ellipse(x, y, 20, 20);
  }
}

void updateWave()
{
  phi += speedPhi;

  float yEta = phi;
  for (int i=0; i<yList.length; i++)
  {
    yList[i] = sin(yEta) * amplitude;
    yEta += speedPhiPerElement;
  }
}