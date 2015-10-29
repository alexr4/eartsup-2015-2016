/* Easing Equations by Robert Penner : http://robertpenner.com/easing/
 Based on ActionScript implementation by gizma : http://gizma.com/easing/
 Processing implementation by Alexandre Rivaux
 
 soit time le temps actuelle;
 soit start la position x de départ;
 soit end l'increment de s donnant la position d'arrivee a = s + e;
 soit duration la durée de l'opération
 */

//linear
float linearTween(float time, float start, float end, float duration)
{ 
  float inc = end - start;
  return inc*time/duration + start;
}

//Quadratic
float inQuad(float time, float start, float end, float duration)
{
  time /= duration;
  float inc = end - start;
  return inc * time * time + start;
}

float outQuad(float time, float start, float end, float duration)
{
  time /= duration;
  float inc = end - start;
  return -inc * time * (time - 2) + start;
}

float inoutQuad(float time, float start, float end, float duration)
{
  time /= duration/2;
  float inc = end - start;
  if (time < 1)
  {
    return inc/2 * time * time + start;
  } else
  {
    time--;
    return - inc/2 * (time * (time - 2) - 1) + start;
  }
}

//Cubic
float inCubic(float time, float start, float end, float duration)
{
  time /= duration;
  float inc = end - start;
  return inc * pow(time, 3) + start;
}

float outCubic(float time, float start, float end, float duration)
{
  time /= duration;
  time --;
  float inc = end - start;
  return inc * (pow(time, 3) + 1) + start;
}

float inoutCubic(float time, float start, float end, float duration)
{
  time /= duration/2;
  float inc = end - start;
  if (time < 1)
  {
    return inc/2 * pow(time, 3) + start;
  } else
  {
    time -= 2;
    return inc/2 * (pow(time, 3) + 2) + start;
  }
}

//Quatric
float inQuartic(float time, float start, float end, float duration)
{
  time /= duration;
  float inc = end - start;
  return inc * pow(time, 4) + start;
}

float outQuartic(float time, float start, float end, float duration)
{
  time /= duration;
  time --;
  float inc = end - start;
  return -inc * (pow(time, 4) - 1) + start;
}

float inoutQuartic(float time, float start, float end, float duration)
{
  time /= duration/2;
  float inc = end - start;
  if (time < 1)
  {
    return inc/2 * pow(time, 4) + start;
  } else
  {
    time -= 2;
    return -inc/2 * (pow(time, 4) - 2) + start;
  }
}

//Quintic
float inQuintic(float time, float start, float end, float duration)
{
  time /= duration;
  float inc = end - start;
  return inc * pow(time, 5) + start;
}

float outQuintic(float time, float start, float end, float duration)
{
  time /= duration;
  time --;
  float inc = end - start;
  return inc * (pow(time, 5) + 1) + start;
}

float inoutQuintic(float time, float start, float end, float duration)
{
  time /= duration/2;
  float inc = end - start;
  if (time < 1)
  {
    return inc/2 * pow(time, 5) + start;
  } else
  {
    time -= 2;
    return inc/2 * (pow(time, 5) + 2) + start;
  }
}

//Sinusoïdal
float inSin(float time, float start, float end, float duration)
{
  float inc = end - start;
  return -inc * cos(time/duration * HALF_PI) + inc + start;
}

float outSin(float time, float start, float end, float duration)
{
  float inc = end - start;
  return inc * sin(time/duration * HALF_PI) + start;
}

float inoutSin(float time, float start, float end, float duration)
{
  float inc = end - start;
  return -inc/2 * (cos(PI * time/duration) - 1) + start;
}

//Exponential
float inExp(float time, float start, float end, float duration)
{
  float inc = end - start;
  //return inc * pow(2, 10 * (time/duration - 1)) + start;
  return inc * pow(2, 10 * (time/duration-1)) + start;
}

float outExp(float time, float start, float end, float duration)
{
  float inc = end - start;
  return inc * (pow(2, -10 * (time/duration)) * -1) - 1 + start;
}

float inoutExp(float time, float start, float end, float duration)
{
  time /= duration/2;
  float inc = end - start;
  if (time < 1)
  {
    return inc/2 * pow(2, 10 * (time-1)) + start;
  } else
  {
    time --;
    return inc/2 * (-pow(2, -10 * time) + 2) + start;
  }
}

//Circular
float inCirc(float time, float start, float end, float duration)
{
  time /= duration;
  float inc = end - start;
  return -inc * (sqrt(1 - time * time) - 1) + start;
}

float outCirc(float time, float start, float end, float duration)
{
  time /= duration;
  time --;
  float inc = end - start;
  return inc * sqrt(1 - time * time) + start;
}

float inoutCirc(float time, float start, float end, float duration)
{
  time /= duration/2;
  float inc = end - start;
  if (time < 1)
  {
    return -inc/2 * (sqrt(1 - time * time) - 1) + start;
  } else
  {
    time -= 2;
    return inc/2 * (sqrt(1 - time * time) + 1) + start;
  }
}