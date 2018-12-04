float angle1 = 0.0;
float time = 0.0;

void setup()
{
  size(700, 400);
}

void draw()
{
  spirale(angle1);
  angle1 += 0.1;
}

void spirale(float angolo)
{
  int x = 10;
  float angle = 0.1;
  
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(angolo);
  for (int i = 0; i < 60; i++)
  {
    pushMatrix();
    rotate(angle);
    translate(x, 0);
    rect(0, 0, 10, 10);
    popMatrix();
    x = x + 1;
    angle += 0.2;
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
