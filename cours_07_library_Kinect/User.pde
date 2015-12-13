class User
{
  //partie des variables
  boolean isTracked;
  color userColor;
  int handRightState;
  int handLeftState;
  
  PVector handRight;
  PVector handLeft;
  
  //Constructeur
  User()
  {
    isTracked = false;
    userColor = color(0, 0, 0);
    handRightState = 1;
    handLeftState = 1;
    handRight = new PVector();
    handLeft = new PVector();
  }
  
  //methodes
  void displayHands()
  {
    if(isTracked == true)
    {
      displayHandRight();
      displayHandLeft();
    }
  }
  
  void etatMain(float x_, float y_)
  {
    String etatDroite = "";
    String etatLeft = "";
    
    if(handRightState == 1)
    {
      etatDroite = "non trackée";
    }
    else if(handRightState == 2)
    {
      etatDroite = "ouverte";
    }
    else if(handRightState == 3)
    {
      etatDroite = "fermée";
    }
    else if(handRightState == 4)
    {
      etatDroite = "Lasso";
    }
    
    
    if(handLeftState == 1)
    {
      etatLeft = "non trackée";
    }
    else if(handLeftState == 2)
    {
      etatLeft = "ouverte";
    }
    else if(handLeftState == 3)
    {
      etatLeft = "fermée";
    }
    else if(handLeftState == 4)
    {
      etatLeft = "Lasso";
    }
    
    
    fill(255);
    text("Main droite : "+etatDroite, x_, y_);
    text("Main gauche : "+etatLeft, x_+200, y_);
  }
  
  void displayHandRight()
  {
     noFill();
     stroke(userColor);
     pushMatrix();
     translate(handRight.x, handRight.y, handRight.z);
     ellipse(0, 0, 40, 40);
     popMatrix();
  }
  
  void displayHandLeft()
  {
     noFill();
     stroke(userColor);
     pushMatrix();
     translate(handLeft.x, handLeft.y, handLeft.z);
     ellipse(0, 0, 40, 40);
     popMatrix();
  }
}