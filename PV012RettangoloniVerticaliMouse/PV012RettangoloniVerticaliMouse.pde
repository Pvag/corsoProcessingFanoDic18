// Riempi il canvas con rettangoloni verticali
//
// La dimensione e' data dalla posizione x del mouse

void setup()
{
  size(1000, 300);
  noStroke();
}

void draw()
{
  int base = (int)map(mouseX, 0, width, 10, 200);
  fillWithVerticalRectsGradient(base);
}

void fillWithVerticalRectsGradient(final int base)
{
  int x = 0;
  final int nRett = width/base;
  int blu = 0;
  
  for (int i = 0; i < nRett; i++) //<>//
  {
    blu = (int)map(i, 0, nRett-1, 0, 255);
    fill(0, 0, blu);
    rect(x, 0, base, height);
    x += base;
  } //<>//
}
