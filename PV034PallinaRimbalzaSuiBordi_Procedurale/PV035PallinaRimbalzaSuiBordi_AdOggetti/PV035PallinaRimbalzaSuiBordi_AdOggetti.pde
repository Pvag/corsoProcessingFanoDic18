// una pallina che rimbalza qua e la nello schermo - versione ad oggetti
// - si noti come questa versione risulta piu' pulita ed ordinata, compatta, organica, modulare

// TODO implementa la versione con molto palline,
//      usando 1 solo array !
// NOTA a differenza della versione procedurale,
//      che ha bisogno di vari array, un array
//      di tipo int per le x, un array di tipo int
//      per le y, un array di tipo int per i deltaX,
//      un array di tipo int per le deltaY...ed
//      eventualmente un array di tipo int per i diam,
//      e cosi' via...!! E' definitivamente chiaro,
//      ora, quanto sia preferibile scrivere codice
//      di questo tipo ad oggetti.

Pallina p1;
  
void setup()
{
  size(400, 300);
  
  final int diam = 30;
  final int xIniziale = 40;
  final int yIniziale = 60;
  final int deltaX = 2;
  final int deltaY = 1;
  p1 = new Pallina(xIniziale, yIniziale, deltaX, deltaY, diam);  
}

void draw()
{
  background(255);
  p1.disegnaPallina();
}
