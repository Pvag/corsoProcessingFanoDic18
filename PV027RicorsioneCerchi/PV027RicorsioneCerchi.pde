// ricorsione - cerchi

void setup()
{
  size(1500, 750);
  noLoop();
  background(0);
  noStroke();
}

void draw()
{
  binocolus(width/2, height/2, height - 10);
  save("binocolus.png");
}

//void disegnaPattern(int x, int y, int diam)
//{
//  if (diam > 1)
//  {
//    translate(x, y);
//    pushMatrix();
//    translate(-diam, 0);
//    ellipse(0, 0, diam, diam);
//    popMatrix();
//    pushMatrix();
//    translate(diam, 0);
//    ellipse(0, 0, diam, diam);
//    popMatrix();
//    disegnaPattern(x-diam, 0, diam/2);
//  } else return;
//}

void binocolus(int x, int y, int diam)
{
  if (diam > 2)
  {
    
    pushMatrix();
    translate(x, y);
    fill(0);
    ellipse(-diam/2, 0, diam, diam);
    binocolus(-diam/2, 0, diam/2);
    popMatrix();

    pushMatrix();
    translate(x, y);
    fill(100, 0, 240);
    ellipse(diam/2, 0, diam, diam);
    binocolus(diam/2, 0, diam/2);
    popMatrix();
  } else return;
}
