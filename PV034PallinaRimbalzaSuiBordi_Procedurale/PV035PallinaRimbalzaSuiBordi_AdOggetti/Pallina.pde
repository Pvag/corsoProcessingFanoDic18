class Pallina
{
  private final int diam;

  private int x;
  private int y;

  private int deltaX;
  private int deltaY;

  // questo si chiama "Constructor" della classe Pallina
  // si occcupa di inizializzare i valori iniziali dell'oggetto che viene instanziato
  Pallina(final int xIniziale, final int yIniziale, final int deltaX, final int deltaY, final int diam)
  {
    inizializzaPosizione(xIniziale, yIniziale);
    inizializzaVelocita(deltaX, deltaY);
    this.diam = diam;
  }

  void disegnaPallina()
  {
    ellipse(x, y, this.diam, this.diam);
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
    this.x = xIniziale;
    this.y = yIniziale;
  }

  void inizializzaVelocita(final int deltaX, final int deltaY)
  {
    this.deltaX = deltaX;
    this.deltaY = deltaY;
  }
  
  // TODO implementa un metodo chiamato inizializzaPosizioneRandom
  // TODO implementa un metodo chiamato inizializzaVelocitaRandom  
}
