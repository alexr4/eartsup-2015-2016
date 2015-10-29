/*
La valeur sinus d'un angle compris entre 0 et 360 degrées sera comprise
entre -1 et 1
*/


float phi; //angle de départ
float speedPhi; //vitesse de l'ange
float periode; //duree de l'angle
float amplitude;

void setup()
{
  size(500, 500);
  periode = 250;
  speedPhi = TWO_PI/periode;
  amplitude = 150;
 }

void draw()
{
  background(0);
  
  updateSin();
  println(cos(phi));
  
  //Line motion
  float lx =width/2 + cos(phi) * amplitude;
  fill(255, 0, 0);
  ellipse(lx, height/2, 20, 20);
  
  //circular motion
  float eta = cos(phi) * PI;
  float cx = width/2 + cos(eta) * 150;
  float cy = height/2 + sin(eta) * 150;
  fill(0, 255, 0);
  ellipse(cx, cy, 20, 20);
  
  //sizeMotion
  float radius = cos(phi) * 50;
  fill(0, 0, 255);
  ellipse(width/2, height/2, radius * 2, radius * 2);
}

void updateSin()
{
  phi += speedPhi;
}