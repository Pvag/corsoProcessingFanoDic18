// Paolo: ho dovuto modificare lo sketch di Andrea, che conteneva delle
// imprecisioni e non sfruttava bene l'array.

int numPalline = 8; // Numbero palline
int diametro = 20; // Dimensione pallina
int posizioneY = height/2; // Palline centrate verticalmente
int[] posizioniX; // Dichiarazione array

void initPalline()
{
  posizioniX = new int[numPalline]; // Creazione array
  for (int i = 0; i < numPalline; i++) {
    posizioniX[i] = i*diametro + diametro;
  }
}

void setup() {
  size(600, 300);
  background(0);
  fill(255);
  noStroke();
  noLoop();
  
  initPalline();
}

void draw() {
  palline();
}

void palline() {
  for (int i = 0; i < numPalline; i++) { 
    ellipse(posizioniX[i], posizioneY, diametro, diametro);
  }
}
