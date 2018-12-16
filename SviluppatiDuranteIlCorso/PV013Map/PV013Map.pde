// Scorri con il mouse da sinistra a destra, sul canvas,
// per vedere il background passare da nero a bianco

int valore;

void setup()
{
  size(1000, 300);
}

void draw()
{
  valore = mouseX;
  int mappato = int(map(valore, 0, width, 0, 255));
  background(mappato);
}
