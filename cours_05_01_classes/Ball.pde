class Ball
{
  //variable de l'objet
  color colorBall;
  float size;
  float speedX;
  float speedY;
  float boxWidth;
  float boxHeight;
  float x;
  float y;
  float originX;
  float originY;
  
  //Constructeur
  Ball()
  {
    colorBall = color(random(255), random(255), random(255));
    size = random(10, 100);
    speedX = random(1, 5);
    speedY = random(1, 5);
    boxWidth = random(size, size+100);
    boxHeight = random(size, size+100);
    x = random(boxWidth/2, width - (boxWidth/2));
    y = random(boxHeight/2, height - (boxHeight/2));
    originX = x;
    originY = y;
  }
  
  //fonctions (comportements de ma baballe)
  void run()
  {
    display();
    displayBox();
    move();
    checkEdge();
  }
  
  void display()
  {
    noStroke();
    fill(colorBall);
    ellipse(x, y, size, size);
  }
  
  void displayBox()
  {
    noFill();
    stroke(255, 0, 0);
    rectMode(CENTER);
    rect(originX, originY, boxWidth, boxHeight);
  }
  
  void move()
  {
    x += speedX;
    y += speedY;
  }
  
  void checkEdge()
  {
    if(x - (size/2) <= originX - (boxWidth/2) || x + (size/2) >= originX + (boxWidth/2))
    {
      speedX *= -1;
    }
    if(y - (size/2) <= originY - (boxHeight/2) || y + (size/2) >= originY +(boxHeight/2))
    {
      speedY *= -1;
    }
  }
  
  void updateShape()
  {
    colorBall = color(random(255), random(255), random(255));
    if(boxWidth > boxHeight)
    {
      size = random(10, boxHeight-10);
    }
    else
    {
      size = random(10, boxWidth - 10);
    }
    
    x = originX;
    y = originY;
  }
}