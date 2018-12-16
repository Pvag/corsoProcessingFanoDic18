// Esempio intermedio per mostrare la necessita' dell'uso degli array,
// in caso si vogliano gestire molti dati

final int diam = 30;
final int nPalline = 1;
int deltaX = 1;
int deltaY = 1;
int x1, y1, x2, y2;

void setup()
{
  size(700, 400);

  x1 = width/2;
  y1 = height/2;
  x2 = width/2 - 70;
  y2 = height/2 - 100;
}

void draw()
{
  ellipse(x1, y1, diam, diam);
  ellipse(x2, y2, diam, diam);
  aggiornaPos();
}

void aggiornaPos()
{
  x1 += deltaX;
  y1 += deltaY;
  x2 += deltaX; // stesso deltaX e deltaY, per entrambe le palline: stesso andamento
  y2 += deltaY;
}
