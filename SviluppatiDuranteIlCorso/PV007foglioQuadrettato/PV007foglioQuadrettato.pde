// Foglio Quadrettato

void setup()
{
  size(801, 401); // 1 pixel in piu' per lo stroke
  noLoop(); // diesgno statico, 1 solo frame, draw() viene chiamato 1 sola volta
}

void draw()
{
  backgroundFoglio();
}

void backgroundFoglio()
{
  final int lato = 20;
  final int nRighe = height/lato;
  int y = 0;
  for (int riga = 0; riga < nRighe; riga++)
  {
    rigaDiQuadrati(y, lato);
    y = y + lato;
  }
}

void rigaDiQuadrati(int y, final int lato)
{
  final int nQuadPerRiga = width/lato;
  int x = 0;
  
  for (int colonna = 0; colonna < nQuadPerRiga; colonna++)
  {
    rect(x, y, lato, lato);
    x = x + lato;
  }
}
