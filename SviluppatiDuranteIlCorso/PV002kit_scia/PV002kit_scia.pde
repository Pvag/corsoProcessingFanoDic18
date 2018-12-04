// In questo sketch disegno un rettangolo rosso che si sposta, tipo kit

int x = 0;
int vel = 3; // velocita
final int lato = 20;
final int rosso_kit = 200;

void setup()
{
  size(300, 200);  // setto la dimensione della finestra (canvas)
  noStroke(); // no bordo alle figure
}

void draw()
{
  kit();
}

void kit()
{
  fill(0, 0, 0, 6.0); // nero trasparente
  rect(0, 0, width, height); // rettangolone
  fill(rosso_kit, 0 , 0); // rosso
  rect(x, 70, lato, lato); // quadrato

  x = prossimaX(x); // chiamata della funzione
}

// implementazione della funziona
// function
// per il calcolo del prossimo valore di x
int prossimaX(int xVecchia)
{
    // cambia verso alla velocita, in caso di uscita dallo schermo
  if (xVecchia > width - lato || xVecchia < 0) // -->  || significa OR
  {
    vel = -vel;
  }

  // il nuovo valore della posizione orizzontale x  
  return xVecchia + vel;
}
