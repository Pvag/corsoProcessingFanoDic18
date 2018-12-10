class Sfondo {
  private int x;
  private int y;
  private color colore;

  Sfondo()
  {
    aggiornaPosizioneMouse();
  }

  void aggiornaPosizioneMouse()
  {
    this.x = mouseX;
    this.y = mouseY;
  }

  void calcolaColore()
  {
    if (mouseInAltoASinistra()) this.colore = color(0, 0, 0);
    else if (mouseInAltoADestra()) this.colore = color(255, 0, 0); // la condizione viene controllata solo se la prima e' risultata falsa
    else if (mouseInBassoASinistra()) this.colore = color(0, 255, 0); // questa viene controllata solo se la prima e la seconda sono risultate false
    else this.colore = color(0, 0, 255); // questa viene eseguita solo se tutte le altre sono false, cioe' per esclusione !
  }

  void colora()
  {
    background(this.colore);
  }

  boolean mouseInAltoASinistra()
  {
    return (this.x < width/2 & this.y < height/2); // questo restituisce o 'true' o 'false'
  }

  boolean mouseInAltoADestra()
  {
    return (this.x > width/2 && this.y < height/2); // questo restituisce o 'true' o 'false'
  }

  boolean mouseInBassoASinistra()
  {
    return (this.x < width/2 && this.y > height/2); // questo restituisce o 'true' o 'false'
  }
}
