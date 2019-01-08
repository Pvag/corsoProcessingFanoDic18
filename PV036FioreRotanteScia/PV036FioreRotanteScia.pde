// Disegna un fiore che, muovendo il mouse da sinistra a destra,
// ruota, cresce e cambia colore.

// Post sul Forum: http://esplora.freeforums.net/thread/55/fiore-rotante-crescente

// GitHub: https://github.com/Pvag/corsoProcessingFanoDic18/tree/master/PV035FioreRotanteCresce

int diamPetali;
float fi0, deltaFi0;
final int nPetali = 5;

boolean eRosso = true;
color bianco = color(255, 1);
color rosso = color(200, 0, 80, 1);
//color verde = color(200, 0, 80, 1);
color colore = rosso;

int x, y;

void setup()
{
  size(600, 300);

  diamPetali = 0;
  fi0 = 0.;
  deltaFi0 = 0.02;

  noStroke(); // prova questo !

  x = width/2;
  y = height/2;
}

void draw()
{
  creaScia();
  fi0 += deltaFi0;
  if (diamPetali > 500)
  {
    diamPetali = 0;
    cambiaColore();
    invertiRotazione();
    aggiornaCentroFiore();
  }

  fioreStaticoPosRandom(x, y, true);
}

void aggiornaCentroFiore()
{
  x = int(random(width-100));
  y = int(random(height-100));
}

void fioreStaticoPosRandom(final int x, final int y, boolean conInversioneDiRotazione)
{
  fiore(x, y, nPetali, diamPetali++, fi0);
  //if (conInversioneDiRotazione) invertiRotazione();
}

void invertiRotazione()
{
  //if (abs(fi0) > 4.*PI) deltaFi0 = - deltaFi0; // inverti senso di rotazione
  deltaFi0 = - deltaFi0;
}

void fioreDisperso()
{
  fiore(int(random(width-100)), int(random(height-100)), nPetali, diamPetali++, fi0);
  deltaFi0 = 0.;
}

void fiore(final int x, final int y, final int nPetali, final int diamPetalo, final float fi0)
{
  translate(x, y); // centro del fiore
  rotate(fi0); // rotazione iniziale complessiva, del fiore
  final float rotPetalo = 2.*PI/nPetali; // rotazione tra un petalo ed il successivo
  final int distanzaPetaloCentro = 90;  // distanza dei petali dal centro del fiore
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

void cambiaColore()
{
  if (eRosso) colore = bianco;
  else colore = rosso;
  eRosso = !eRosso;
}

// imposta il colore del fiore in base alla coordinata x della posizione del mouse
void impostaColore()
{
  //int green = int(map(mouseX, 0, width, 256, 0)); // map decrescente !
  //int blue = int(map(mouseX, 0, width, 0, 256)); // map crescente !
  fill(colore);
}

void creaScia()
{
  fill(0, 0, 100, 8);
  rect(0, 0, width, height);
}
