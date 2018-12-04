int x = 0;

void setup()
{
  size(800, 600);
}

void draw()
{  
  background(255);
  rect(x++, 10, 10, 10);
  if (mousePressed) noLoop();
}

void mouseReleased()
{
  loop();
}
