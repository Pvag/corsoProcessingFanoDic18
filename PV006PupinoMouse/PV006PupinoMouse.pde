void setup()
{
  size(800, 600);
}

void draw()
{
  background(0, 0, 100);
  pupino(mouseX, mouseY);
}

// x ed y sono le coordinate del centro del pupino 
void pupino(int x, int y)
{
  ellipse(x, y, 50, 50); // faccia
  ellipse(x-10, y-10, 10, 10); // occhio sinistro
  ellipse(x+10, y-10, 10, 10); // occhio destro
  ellipse(x, y+20, 5, 5); // bocca
}
