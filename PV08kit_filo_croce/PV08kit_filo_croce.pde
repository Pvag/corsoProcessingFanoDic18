int x = 0;
int y = 0;
int velX = 3; // velocita x
int velY = 3; // velocita Y
final int lato = 20;
final int rosso_kit = 200;

void setup()
{
  size(300, 200); // setto la dimensione della finestra (canvas)
  noStroke(); // no bordo alle figure
}

void draw()
{
  kit();
  kit1();
  kit2();
  kit3y();
  kit4y();
  kit5y();
}

void kit()
{
  fill(0, 0, 0, 6.0); // nero trasparente
  rect(0, 0, width, height); // rettangolone
  fill(rosso_kit, 0, 0); // rosso
  rect(x, 70, lato, lato); // quadrato

  x = prossimaX(x); // chiamata della funzione
}

// implementazione della funzione
// function
// per il calcolo del prossimo valore di x
int prossimaX(int xVecchia)
{
  // cambia verso alla velocita, in caso di uscita dallo schermo
  if (xVecchia > width - lato || xVecchia < 0) // --> || significa OR
  {
    velX = -velX;
  }

  // il nuovo valore della posizione orizzontale x 
  return xVecchia + velX;
}

void kit1()
{
  fill(0, 0, 0, 6.0); // nero trasparente
  rect(0, 0, width, height); // rettangolone
  fill(rosso_kit, 0, 0); // rosso
  rect(x, 100, lato, lato); // quadrato
} 

void kit2()
{
  fill(0, 0, 0, 6.0); // nero trasparente
  rect(0, 0, width, height); // rettangolone
  fill(rosso_kit, 0, 0); // rosso
  rect(x, 130, lato, lato); // quadrato
} 

void kit3y()
{
  fill(0, 0, 0, 6.0); // nero trasparente
  rect(0, 0, width, height); // rettangolone
  fill(rosso_kit, 0, 0); // rosso
  rect(70, y, lato, lato); // quadrato

  y = prossimaY(y); // chiamata della funzione
}

// implementazione della funzione
// function
// per il calcolo del prossimo valore di y
int prossimaY(int yVecchia)
{
  // cambia verso alla velocita, in caso di uscita dallo schermo
  if (yVecchia > height - lato || yVecchia < 0) // --> || significa OR
  {
    velY = -velY;
  }

  // il nuovo valore della posizione verticale y 
  return yVecchia + velY;
}

void kit4y()
{
  fill(0, 0, 0, 6.0); // nero trasparente
  rect(0, 0, width, height); // rettangolone
  fill(rosso_kit, 0, 0); // rosso
  rect(100, y, lato, lato); // quadrato
}

void kit5y()
{
  fill(0, 0, 0, 6.0); // nero trasparente
  rect(0, 0, width, height); // rettangolone
  fill(rosso_kit, 0, 0); // rosso
  rect(130, y, lato, lato); // quadrato
}
