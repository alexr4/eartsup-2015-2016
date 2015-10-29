//obj1
float speedXObj0;
float speedYObj0;
float xObj0;
float yObj0;
float radiusObj0;

//obj2
float speedXObj1;
float speedYObj1;
float xObj1;
float yObj1;
float radiusObj1;

float distanceObj0Obj1;
float hypotenuse;

void setup()
{
  size(500, 500);
  //obj1
  radiusObj0 = random(20, 40);
  speedXObj0 = random(15);
  speedYObj0 = random(15);
  xObj0 = random(radiusObj0, width-radiusObj0);
  yObj0 = random(radiusObj0, height-radiusObj0);

  //obj1
  radiusObj1 = random(20, 40);
  speedXObj1 = random(2.5);
  speedYObj1 = random(2.5);

  xObj1 = random(radiusObj1, width-radiusObj1);
  yObj1 = random(radiusObj1, height-radiusObj1);

  //hypotenuse
  hypotenuse = sqrt(pow(width, 2) + pow(height, 2))/2;
}

void draw()
{
  background(0);

  updateLocationObj0();
  checkEdgeObj0();

  updateLocationObj1();
  checkEdgeObj1();

  checkDistance();

  ellipse(xObj1, yObj1, radiusObj1 * 2, radiusObj1 * 2);
  ellipse(xObj0, yObj0, radiusObj0 * 2, radiusObj0 * 2);

  if (distanceObj0Obj1 < hypotenuse)
  {
    float lineColor = map(distanceObj0Obj1, 0, hypotenuse, 255, 0);
    stroke(255, lineColor);
    line(xObj0, yObj0, xObj1, yObj1);
  }
}

//obj1
void updateLocationObj0()
{
  xObj0 += speedXObj0;
  yObj0 += speedYObj0;
}

void checkEdgeObj0()
{
  if (xObj0 > width - radiusObj0 || xObj0 < 0 + radiusObj0)
  {
    speedXObj0 *= -1;
  }

  if (yObj0 > height - radiusObj0 || yObj0 < 0 + radiusObj0)
  {
    speedYObj0 *= -1;
  }
}

//obj2
void updateLocationObj1()
{
  xObj1 += speedXObj1;
  yObj1 += speedYObj1;
}

void checkEdgeObj1()
{
  if (xObj1 > width - radiusObj1 || xObj1 < 0 + radiusObj1)
  {
    speedXObj1 *= -1;
  }

  if (yObj1 > height - radiusObj1 || yObj1 < 0 + radiusObj1)
  {
    speedYObj1 *= -1;
  }
}

//checkDistance
void checkDistance()
{
  distanceObj0Obj1 = dist(xObj0, yObj0, xObj1, yObj1);
  if (distanceObj0Obj1 <= radiusObj0 + radiusObj1)
  {
    speedXObj0 *= -1;
    speedYObj0 *= -1;

    speedXObj1 *= -1;
    speedYObj1 *= -1;
  }
}