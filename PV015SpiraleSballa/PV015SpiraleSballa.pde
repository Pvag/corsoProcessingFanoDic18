float angle1 = 0.0;
float angle2 = 0.0;
float time = 0.0;

void setup()
{
  size(700, 400);
}

void draw()
{
  background(255);
  spirale(100, 100, angle1, 50, map(mouseX, 0, width, 1, 1.2), 4);
  spirale(300, 100, angle2, 10000, 0.03, 1);
  pushStyle();
  noStroke();
  fill(0, 0, 255, 60);
  spirale((int)(100*sin(angle1)) + width/2, 260, angle1, 100, 0.2, 1);
  popStyle();
  angle1 += 0.01;
  angle2 -= 0.04;
}

void spirale(int x, int y, float angolo, int nEl, float rot, float deltaX)
{
  int localX = 10;
  float angle = 0.1;

  pushMatrix();
  translate(x, y);
  rotate(angolo);
  for (int i = 0; i < nEl; i++)
  {
    pushMatrix();
    rotate(angle);
    translate(localX, 0);
    rect(0, 0, 10, 10);
    popMatrix();
    localX += deltaX;
    angle += rot;
  }

  popMatrix();
}

void rosa()
{
  translate(mouseX, mouseY);
  for (int i = 0; i < 20; i++)
  {
    rotate(angle1);
    rect(0, 0, 20, 20);

    angle1 += 0.1;
    time += 0.1;
  }
}

void rosaGrowing()
{
  pushStyle();
  stroke(0);
  fill(0, 80, 180, 10.0);
  translate(mouseX, mouseY);
  int radius = 10;
  for (int i = 0; i < 20; i++)
  {
    rotate(angle1);
    ellipse(0, 0, radius, radius);
    translate(10, 0);

    angle1 += 0.1;
    time += 0.1;
  }
  popStyle();
}
