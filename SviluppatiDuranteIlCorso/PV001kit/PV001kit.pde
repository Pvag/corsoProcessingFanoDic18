// In questo sketch disegno un rettangolo rosso che si sposta, tipo kit

int x = 0;
int vel = 3; // velocita
final int lato = 20;
final int rosso_kit = 200;

void setup()
{
  size(300, 200);  // setto la dimensione della finestra (canvas)
  noStroke(); // no bordo alle figure
  fill(rosso_kit, 0 , 0); // rosso
}

void draw()
{
  background(0);
  rect(x, 70, lato, lato);

  // cambia verso alla velocita, in caso di uscita dallo schermo
  if (x > width - lato || x < 0) // -->  || significa OR
  {
    vel = -vel;
  }

  // il nuovo valore della posizione orizzontale x
  x = x + vel;
}
