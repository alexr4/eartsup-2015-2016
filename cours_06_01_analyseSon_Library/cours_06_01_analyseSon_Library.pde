Square[] squareList;
//analys Audio
FFTObject myFft;

void setup()
{
  size(1280, 720);

  initMinim("03_Evento.wav");
  myFft = new FFTObject(60);
  myFft.play();

  squareList = new Square[3];

  for (int i=0; i<squareList.length; i++)
  {
    float x = (width/3) * i + (width/3)/2;
    squareList[i] = new Square(x, height/2);
  }
}

void draw()
{
  background(0);
  
  if(myFft.isPlaying() == true && squareList.length > 0)
  {
    myFft.computeAverageLowMedHighLevel();
    float bass = myFft.getAverageBass();
    float mid = myFft.getAverageMidRange();
    float high = myFft.getAverageHighMid()*10;
    
    squareList[0].squareWidth = bass;
    squareList[0].squareHeight = bass;
    squareList[1].squareWidth = mid;
    squareList[1].squareHeight = mid;
    squareList[2].squareWidth = high;
    squareList[2].squareHeight = high;
  }
  
  for (int i = 0; i<squareList.length; i++)
  {
    squareList[i].run();
  }
}