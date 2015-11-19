void setup()
{
  size(500, 500);
}

void draw()
{
  background(255);
  fill(0);
  textSize(24);
  text(day()+"/"+month()+"/"+year(), 20, 20);
  text(hour()+":"+minute()+":"+second(), 20, 80);
  text(millis(), 20, 140);
}