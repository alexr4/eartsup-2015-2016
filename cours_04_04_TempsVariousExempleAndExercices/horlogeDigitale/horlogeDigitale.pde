
void setup()
{
  size(800, 400, P2D);
}

void draw()
{
  background(0);
  fill(255);
  textSize(40);
  text(day()+" / "+month()+" / "+year()+" "+hour()+" : "+minute()+" : "+second()+" : "+millis(), 10, height/2);
}