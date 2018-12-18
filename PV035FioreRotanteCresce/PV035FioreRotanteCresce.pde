// Disegna un fiore che, muovendo il mouse da sinistra a destra,
// ruota, cresce e cambia colore.

// Post sul Forum: http://esplora.freeforums.net/thread/55/fiore-rotante-crescente

// GitHub: https://github.com/Pvag/corsoProcessingFanoDic18/tree/master/PV035FioreRotanteCresce

void setup()
{
  size(600, 300);
}

void draw()
{
  background(255);
  
  float fi0 = map(mouseX, 0, width, 0., TAU); // rotazione iniziale complessiva, del fiore
  int diamPetali = int(map(mouseX, 0, width, 0, 200)); // diametro del petalo
  final int nPetali = 5;
  fiore(mouseX, mouseY, nPetali, diamPetali, fi0);
}

void fiore(final int x, final int y, final int nPetali, final int diamPetalo, final float fi0)
{
  translate(x, y); // centro del fiore
  rotate(fi0); // rotazione iniziale complessiva, del fiore
  final float rotPetalo = 2*PI/nPetali; // rotazione tra un petalo ed il successivo
  final int distanzaPetaloCentro = 40;  // distanza dei petali dal centro del fiore
  for (int i = 1; i <= nPetali; i++)
  {
    impostaColore();
    rotate(rotPetalo);
    pushMatrix();
    translate(distanzaPetaloCentro, 0);
    ellipse(0, 0, diamPetalo, diamPetalo);
    popMatrix();
  }
}

// imposta il colore del fiore in base alla coordinata x della posizione del mouse
void impostaColore()
{
  noStroke();
  int green = int(map(mouseX, 0, width, 256, 0)); // map decrescente !
  int blue = int(map(mouseX, 0, width, 0, 256)); // map crescente !
  fill(0, green, blue, 60);
}
