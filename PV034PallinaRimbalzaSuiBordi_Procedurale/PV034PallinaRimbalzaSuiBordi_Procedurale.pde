// una pallina che rimbalza qua e la nello schermo - versione procedurale

// Notare che in questa versione ho bisogno di alcune variabili globali,
// mentre nella versione ad oggetti ce n'e' una sola, la variabile p1.
// Come gia' spiegato varie volte, e' preferibile avere meno variabili globali possibile !

// TODO implementa la versione con molto palline,
//      usando vari array
// NOTA a differenza della versione ad oggetti,
//      che ha bisogno di 1 solo array, un array
//      di tipo Pallina !!

int x, y;
int deltaX, deltaY;
final int diam = 30;

void setup()
{
  size(400, 300);

  final int xIniziale = 40;
  final int yIniziale = 60;
  final int deltaX = 2;
  final int deltaY = 1;
  inizializzaPosizione(xIniziale, yIniziale);
  inizializzaVelocita(deltaX, deltaY);
}

void draw()
{
  background(255);
  disegnaPallina();
}

void disegnaPallina()
{
  ellipse(x, y, diam, diam);
  aggiornaPosizione();
}

void aggiornaPosizione()
{
  aggiornaDeltaConRimbalzoSuiBordi();
  
  x += deltaX;
  y += deltaY;
}

void aggiornaDeltaConRimbalzoSuiBordi()
{
  if (x - diam/2 < 0) deltaX = abs(deltaX);
  else if (x + diam/2 > width) deltaX = -abs(deltaX);
  if (y - diam/2 < 0) deltaY = abs(deltaY);
  else if (y + diam/2 > height) deltaY = -abs(deltaY);
}

void inizializzaPosizione(final int xIniziale, final int yIniziale)
{
  x = xIniziale;
  y = yIniziale;
}

void inizializzaVelocita(final int vX, final int vY)
{
  deltaX = vX;
  deltaY = vY;
}
