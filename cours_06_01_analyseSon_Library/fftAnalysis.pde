/*
Music analysis is not just frequency analysis. Analyze frequency by homogeneous bande is not the best way to have
 a view of medium, low and high.
 In order to complete a good view of sound, the following class developped 3 methods to get the average level of
 Low, Medium and High. Each of these are allocate on differents frequency range :
 Low : from 0 to 269
 Medium : from 269 to 5000
 High : from 5000 to 10000
 */

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer music;
AudioMetaData meta;

void initMinim(String songPath)
{
  minim = new Minim(this);
  music = minim.loadFile(songPath, 1024);
  meta = music.getMetaData();

  // loop music
  //music.loop();
}

class FFTObject
{
  //variables
  FFT fft;
  float specSize;
  int nbDividerBande;
  float step;

  int ys;
  int yi;

  Timer timer;  
  int countDown;
  //Global Average
  float averageLow, averageMedium, averageHigh;
  float startAverageLow, endAverageLow, startAverageMedium, endAverageMedium, startAverageHigh, endAverageHigh;

  //Specific Average
  float averageSubBass, averageBass, averageMidRange, averageHighMid, averageHighs; 
  float startAverageSubBass, endAverageSubBass, stepAverageSubBass, seuilAverageSubBass;
  float startAverageBass, endAverageBass, stepAverageBass, seuilAverageBass;
  float startAverageMidRange, endAverageMidRange, stepAverageMidRange, seuilAverageMidRange;
  float startAverageHighMid, endAverageHighMid, stepAverageHighMid, seuilAverageHighMid;
  float startAverageHighs, endAverageHighs, stepAverageHighs, seuilAverageHighs;

  //constructeur
  FFTObject(float fps)
  {
    fft = new FFT( music.bufferSize(), music.sampleRate() );
    specSize =  fft.specSize();
    nbDividerBande = round(fft.specSize()/10);
    step = 50;

    ys = 25;
    yi = 15;

    initGlobalAverages();
    initSpecificAverages();

    countDown= floor(1000/fps);
    timer = new Timer(countDown);
  }

  //init 
  void initGlobalAverages()
  {
    startAverageLow = 40;
    endAverageLow = 269;
    startAverageMedium = 269;
    endAverageMedium = 5000;
    startAverageHigh = 5000;
    endAverageHigh= 10000;
  }

  void initSpecificAverages()
  {
    //SubBass
    startAverageSubBass = 35;
    endAverageSubBass = 115;
    stepAverageSubBass = 5;
    seuilAverageSubBass = 100;

    //Bass
    startAverageBass = 116;
    endAverageBass = 400;
    stepAverageBass = 10;
    seuilAverageBass = 55;

    //MidRange
    startAverageMidRange = 401;
    endAverageMidRange = 700;
    stepAverageMidRange = 35;
    seuilAverageMidRange = 20;

    //HighMid
    startAverageHighMid = 701;
    endAverageHighMid = 2500;
    stepAverageHighMid = 50;
    seuilAverageHighMid = 10;

    //Highs
    startAverageHighs = 2501;
    endAverageHighs = 5500;
    stepAverageHighs = 150;
    seuilAverageHighs = 3;
  }

  //methode
  void play()
  {
    music.play();
    timer.start();
  }

  void pause()
  {
    music.pause();
  }

  void rewind()
  {
    music.rewind();
  }

  void stop()
  {
    pause();
    rewind();
  }

  void computeAverageLowMedHighLevel()
  {
    if (timer.isFinished())
    {
     /* averageLow = getLow();
      averageMedium = getMedium();
      averageHigh = getHigh();*/

      //getAverageFreqOn(Frequence de départ, fréquence d'arrivée, Pas, Seuil minimum);
      averageSubBass = getAverageFreqOn(startAverageSubBass, endAverageSubBass, stepAverageSubBass, seuilAverageSubBass);
      averageBass = getAverageFreqOn(startAverageBass, endAverageBass, stepAverageBass, seuilAverageBass);
      averageMidRange = getAverageFreqOn(startAverageMidRange, endAverageMidRange, stepAverageMidRange, seuilAverageMidRange);
      averageHighMid =getAverageFreqOn(startAverageHighMid, endAverageHighMid, stepAverageHighMid, seuilAverageHighMid);
      averageHighs =  getAverageFreqOn(startAverageHighs, endAverageHighs, stepAverageHighs, seuilAverageHighs);

      timer.start();
    }
  }

  void showDebug()
  {
    float startX = 30;
    float resFreq = 10;
    float res = 50;
    float margin = 10;

    //showDebugLowMedHigh(startX, height-100, 50, 10);
    showFrequencyBands(startX, height-100, resFreq, 500, 50);
    showDebugFiveRangeAnalysis(startX+500 + 10, height-100, res, 10);
    displayInformations(startX, 30);
  }

  void displayInformations(float x_, float y_)
  {
    float y = y_;


    fill(127);
    text("File Name: " + getFilename(), x_, y);
    text("Length (in seconds): " + getMusicLength()/1000, x_, y+=yi);
    text("Title: " + getTitle(), x_, y+=yi);
    text("Author: " + getAuthor(), x_, y+=yi); 
    text("Album: " + getAlbum(), x_, y+=yi);
    text("Date: " + getDate(), x_, y+=yi);
    text("Comment: " + getComment(), x_, y+=yi);
    text("Track: " + getTrack(), x_, y+=yi);
    text("Genre: " + getGenre(), x_, y+=yi);
    text("Copyright: " + getCopyright(), x_, y+=yi);
    text("Disc: " + getDisc(), x_, y+=yi);
    text("Composer: " + getComposer(), x_, y+=yi);
    text("Orchestra: " + getOrchestra(), x_, y+=yi);
    text("Publisher: " + getPublisher(), x_, y+=yi);
    text("Encoded: " + getEncoded(), x_, y+=yi);
    text("Music playback : "+getPosition()/1000+" / "+getMusicLength()/1000, x_, y+=yi);
  }

  void showFrequencyBands(float x, float y, float res, float widthFreq, float step)
  {
    if (isPlaying())
    {
      noFill();
      beginShape();
      fill(255, 50);
      stroke(255, 100);
      vertex(x, y);
       for (int i = 0; i<endAverageHighs; i+=step)
      {
        float level = getFreq(i);//getFFTLevel(i);
        float offset = map(i, 0, endAverageHighs, 0, widthFreq);
        float hue = map(offset, 0, widthFreq, 0, 360);
        float xi = x+offset;//i*res;
        float yi = y-(level*5);

        vertex(xi, yi);
      }
      vertex(x+widthFreq, y);
      endShape(CLOSE);

      pushStyle();
      for (int i = 0; i<endAverageHighs; i+=step)
      {
        float level = getFreq(i);//getFFTLevel(i);
        float offset = map(i, 0, endAverageHighs, 0, widthFreq);
        float xi = x+offset;//i*res;
        float yi = y-(level*5);
        
        if (i >= startAverageSubBass && i < endAverageSubBass)
        {
          stroke(255, 0, 0);
        } else if (i >= startAverageBass && i < endAverageBass)
        {
          stroke(255, 255, 0);
        } else if (i >= startAverageMidRange && i < endAverageMidRange)
        {
          stroke(0, 255, 0);
        } else if (i >= startAverageHighMid && i < endAverageHighMid)
        {
          stroke(0, 255, 255);
        } else if (i >= startAverageHighs && i < endAverageHighs)
        {
          stroke(0, 0, 255);
        }
      
        line(xi, yi, xi, y);
        
      }
      popStyle();

      /*AverageLow Ref*/
     /* float r0 = map(endAverageLow, 0, endAverageHighs, 0, widthFreq);
      float r1 = map(endAverageMedium-startAverageMedium, 0, endAverageHighs, 0, widthFreq);
      float r2 = map(endAverageHigh-startAverageHigh, 0, endAverageHighs, 0, widthFreq);
      float yGA = y + 5;
      rectMode(CORNER);
      noStroke();
      fill(255, 0, 0);
      rect(x, yGA, r0, 5);
      fill(0, 255, 0);
      rect(x+r0, yGA, r1, 5);
      fill(0, 0, 255);
      rect(x+r0+r1, yGA, r2, 5);*/

      //debug SpecificAverage
      float lastRectWidth = 0;
      float yRect = y+15;
      noStroke();
      for (int i = 0; i < 5; i++)
      {
        float rectWidth = 0;
        float xRect = x;
        if (i%5 == 0)
        {
          rectWidth = map(endAverageSubBass, 0, endAverageHighs , 0, widthFreq);
          fill(255, 0, 0);
        } else if (i%5 == 1)
        {
          rectWidth = map(endAverageBass-startAverageBass, 0, endAverageHighs , 0, widthFreq);
          fill(255, 255, 0);
        } else if (i%5 == 2)
        {
          rectWidth = map(endAverageMidRange-startAverageMidRange, 0, endAverageHighs, 0, widthFreq);
          fill(0, 255, 0);
        } else if (i%5 == 3)
        {
          rectWidth = map(endAverageHighMid-startAverageHighMid, 0, endAverageHighs, 0, widthFreq);
          fill(0, 255, 255);
        } else if (i%5 == 4)
        {
          rectWidth = map(endAverageHighs-startAverageHighs, 0, endAverageHighs, 0, widthFreq);
          fill(0, 0, 255);
        }
        xRect += lastRectWidth;
        rect(xRect, yRect, rectWidth, 5);
        lastRectWidth += rectWidth;
      }
    }
  }

  void showDebugLowMedHigh(float x, float y, float res, float margin)
  {
    if (isPlaying())
    {


      pushStyle();
      noStroke();
      rectMode(CORNER);

      for (int i =0; i<3; i++)
      {
        float xi = x+i*(res+margin);
        float yi = y;

        if (i%3 == 0)
        {
          fill(255, 0, 0);
          yi += averageLow;
          text("Low", x, y+15);     
          text(averageLow, xi, y-averageLow-10);
        } else if (i%3 == 1)
        {
          fill(0, 255, 0);
          yi += averageMedium;
          text("Medium", xi, y+15);
          text(averageMedium, xi, y-averageMedium-10);
        } else if (i%3 ==2)
        {
          fill(0, 0, 255);
          yi += averageHigh;
          text("High", xi, y+15);
          text(averageHigh, xi, y-averageHigh-10);
        }
        rect(xi, y, res, y-yi);
      }
      popStyle();

      //debugText
      fill(255);
      text("averages sampled\non "+countDown+" milliseconds", x, y+40);
    }
  }

  void showDebugFiveRangeAnalysis(float x, float y, float res, float margin)
  {
    if (isPlaying())
    {
      pushStyle();
      noStroke();
      rectMode(CORNER);

      for (int i =0; i<5; i++)
      {
        float xi = x+i*(res+margin);
        float yi = y;
        //averageSubBass, averageBass, averageMidRange, averageHighMid, averageHighs
        if (i%5 == 0)
        {
          fill(255, 0, 0);
          yi += averageSubBass;
          text("SubBass", xi, y+15);     
          text(averageSubBass, xi, y-averageSubBass-10);
        } else if (i%5 == 1)
        {
          fill(255, 255, 0);
          yi += averageBass;
          text("Bass", xi, y+15);     
          text(averageBass, xi, y-averageBass-10);
        } else if (i%5 ==2)
        {
          fill(0, 255, 0);
          yi += averageMidRange;
          text("MidRange", xi, y+15);     
          text(averageMidRange, xi, y-averageMidRange-10);
        } else if (i%5 ==3)
        {
          fill(0, 255, 255);
          yi += averageHighMid;
          text("HighMid", xi, y+15);     
          text(averageHighMid, xi, y-averageHighMid-10);
        } else if (i%5 ==4)
        {
          fill(0, 0, 255);
          yi += averageHighs;
          text("Highs", xi, y+15);     
          text(averageHighs, xi, y-averageHighs-10);
        }
        rect(xi, y, res, y-yi);
      }
      popStyle();

      //debugText
      fill(255);
      text("averages sampled\non "+countDown+" milliseconds", x, y+40);
    }
  }

  boolean isPlaying()
  {
    return music.isPlaying();
  }

  float getFreq(float freq)
  {
    fft.forward( music.mix ); 
    return fft.getFreq(freq);
  }

  float getAverageFreqOn(float start, float end, float step, float seuil)
  {
    float average = 0;
    float size = 0;//end-start;

    try
    {
      for (float i=start; i < end; i+= step)
      {
        if (getFreq(i) > seuil)
        {
          average += getFreq(i);
          size ++;
        }
      }
      float finalAverage = average/size;

      return finalAverage;
    }
    catch(Exception e)
    {
      return average;
    }
  }

  float getLow()
  {
    return getAverageFreqOn(startAverageLow, endAverageLow, step, 0.0);
  }

  float getMedium()
  {
    return getAverageFreqOn(startAverageMedium, endAverageMedium, step, 0.0);
  }

  float getHigh()
  {
    return getAverageFreqOn(startAverageHigh, endAverageHigh, step, 0.0);
  }

  float getAverageLow()
  {
    return averageLow;
  }

  float getAverageMedium()
  {
    return averageMedium;
  }

  float getAverageHigh()
  {
    return averageHigh;
  }
  
  float getAverageSubBass()
  {
    return averageSubBass;
  }

  float getAverageBass()
  {
    return averageBass;
  }
  
  float getAverageMidRange()
  {
    return averageMidRange;
  }
  
  float getAverageHighMid()
  {
    return averageHighMid;
  }
  
  float getAverageHighs()
  {
    return averageHighs;
  }


  float getFFTLevel(int index)
  {
    fft.forward( music.mix ); 
    float fftLevel = fft.getBand(index); 

    return fftLevel;
  }

  int getNumberBande()
  {
    return nbDividerBande;
  }

  int getMusicLength()
  {
    return music.length();
  }

  String getFilename()
  {
    return meta.fileName();
  }

  String getTitle()
  {
    return meta.title();
  }

  String getAuthor()
  {
    return meta.author();
  }

  String getAlbum()
  {
    return meta.album();
  }

  String getDate()
  {
    return meta.date();
  }

  String getComment()
  {
    return meta.comment();
  }

  String getTrack()
  {
    return meta.track();
  }

  String getGenre()
  {
    return meta.genre();
  }

  String getCopyright()
  {
    return meta.copyright();
  }

  String getDisc()
  {
    return meta.disc();
  }

  String getComposer()
  {
    return meta.composer();
  }

  String getOrchestra()
  {
    return meta.orchestra();
  }

  String getPublisher()
  {
    return meta.publisher();
  }

  String getEncoded()
  {
    return meta.encoded();
  }

  float getPosition()
  {
    return music.position();
  }

  float getPan()
  {
    return music.getPan();
  }

  float getVolume()
  {
    return music.getVolume();
  }

  float getGain()
  {
    return music.getGain();
  }
}