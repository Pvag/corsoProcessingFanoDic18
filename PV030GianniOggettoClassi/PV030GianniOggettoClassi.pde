Persona gianni;

void setup()
{
  size(300, 300);
  gianni = new Persona("Gianni", 60);
  noLoop();
}

void draw()
{
  // questo e' molto interessante: l'oggetto sa fare delle cose,
  // posso chiedergli di fare delle azioni e lui le fa !
  gianni.saluta();
  gianni.disegnaUnCerchioAlCentroDelCanvas();
}
