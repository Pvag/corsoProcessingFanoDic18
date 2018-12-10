Sfondo sfondo;

void setup()
{
  size (1200, 800);
  
  sfondo = new Sfondo();
}

void draw()
{
  sfondo.aggiornaPosizioneMouse();
  sfondo.calcolaColore();
  sfondo.colora();
}
