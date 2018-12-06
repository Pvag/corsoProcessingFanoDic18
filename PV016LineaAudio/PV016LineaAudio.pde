final int deltaX = 10;
int oldX, oldY, newX, newY;
int nLines;

void setup()
{
  size(1000, 100);
  nLines = width/deltaX;
  oldX = 0;
  oldY = 0;
}

void draw()
{
  background(255);
  translate(0, height/2);
  for (int i = 0; i < nLines; i++)
  {
    newX = oldX + deltaX;
    newY = (int)random(80) - 40;
    line(oldX, oldY, newX, newY);
    oldX = newX;
    oldY = newY;
  }
  oldX = 0;
}
