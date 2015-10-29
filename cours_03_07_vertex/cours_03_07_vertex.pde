float margin = 100;

void setup()
{
  size(600, 250, P3D);
}

void draw()
{
  background(200);
  
  //Simple
  beginShape();
  vertex(10, 10);
  vertex(100, 10);
  vertex(100, 100);
  vertex(10, 100);
  endShape(CLOSE);

  //PointShape
  beginShape(POINTS);
  vertex(margin + 10, 10);
  vertex(margin + 100, 10);
  vertex(margin + 100, 100);
  vertex(margin + 10, 100);
  endShape();
  
  //line
  beginShape(LINES);
  vertex(margin*2 + 10, 10);
  vertex(margin*2 + 100, 10);
  vertex(margin*2 + 100, 100);
  vertex(margin*2 + 10, 100);
  endShape();
  
  //triangle
  beginShape(TRIANGLES);
  vertex(margin*3 + 10, 10);
  vertex(margin*3 + 100, 10);
  vertex(margin*3 + 10, 100);
  
  vertex(margin*4 + 100, 10);
  vertex(margin*4 + 100, 100);
  vertex(margin*4 + 10, 100);
  endShape();
  
  //triangle Strip
  beginShape(TRIANGLE_STRIP);
  vertex(10, margin + 10);
  vertex(100, margin + 10);
  vertex(10, margin + 100);
  
  vertex(margin + 100, margin + 10);
  vertex(margin + 100, margin + 100);
  vertex(margin + 10, margin + 100);
  endShape();
  
  //triangle_FAN
  beginShape(TRIANGLE_FAN);
  vertex(margin*2 + 55, margin+55);//center
  vertex(margin*2 + 10, margin +10);
  vertex(margin*2 + 100, margin +10);
  vertex(margin*2 + 100, margin + 100);
  vertex(margin*2 + 10, margin + 100);
  vertex(margin*2 + 10, margin + 10);
  endShape();
  
  //QUAD
  beginShape(QUAD);
  vertex(margin*3 + 10, margin + 10);
  vertex(margin*3 + 10, margin + 100);
  vertex(margin*3 + 50, margin + 100);
  vertex(margin*3 + 50, margin + 10);
  endShape();
  
  //QUAD_STRIP
  beginShape(QUAD_STRIP);
  vertex(margin*4 + 10, margin + 10);
  vertex(margin*4 + 10, margin + 100);
  vertex(margin*4 + 50, margin + 10);
  vertex(margin*4 + 50, margin + 100);
  
  
  vertex(margin*4 + 70, margin + 10);
  vertex(margin*4 + 70, margin + 100);
  vertex(margin*4 + 110, margin + 10);
  vertex(margin*4 + 110, margin + 100);
  endShape();
}