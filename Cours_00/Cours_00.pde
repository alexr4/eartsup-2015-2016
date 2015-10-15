void setup()
{
  size(800, 600);
  //fullScreen();
  colorMode(HSB, 360, 100, 100, 100);
}

void draw()
{
  //ici fond
  background(200, 100, 100);
  
  //ici formes
  //strokeCap(ROUND);
  /*strokeWeight(50);
  stroke(255, 0, 255);*/
  noStroke();
  fill(0, 100, 100);
  point(100, 200);
  line(0, 0, 255, 255);
  triangle(0,300, 255, 255, 500, 600);
  quad(700, 0, 800, 0, 800, 150, 600, 100);
  rectMode(CENTER);
  rect(250, 250, 100, 500);
  ellipseMode(CORNER);
  ellipse(250, 250, 200, 200);
  
  //ici texte
  fill(160, 100, 100, 50);
  textAlign(CENTER);
  textSize(40);
  text("Hello WORLD!!!!", mouseX, mouseY);
  
  rectMode(CORNER);
  strokeWeight(1);
  stroke(0);
  noFill();
  rect(0, height/2, mouseX, mouseY);
}