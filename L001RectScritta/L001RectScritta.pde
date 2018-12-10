// Crea rettangoli random e, ad ogni click, pulisce lo sfondo e aggiunge una scritta,
// scegliendo il font random tra un elenco di font pre-caricati.

int x, y;
int semiLarghezza;
int semiAltezza;
PFont[] fonts;

void setup()
{
  size(600, 600);
  semiLarghezza = width/2;
  semiAltezza = height/2;

  // caricamento dei font nell'array fonts
  loadFonts();
  
  background(200);
  frameRate(7);
}

void loadFonts()
{
  PFont didotBold200, didotItalic200, serif100, at100;
  // crea questi 4 font (usa il menu "Tools" --> "Create Fonts", per creare il font (file .vlw)
  // il file del font deve risiedere nella directory "data", entro la directory dello sketch
  didotBold200 = createFont("Didot-Bold", 200);
  didotItalic200 = createFont("Didot-Italic", 200);
  serif100 = createFont("Serif", 100);
  at100 = createFont("AmericanTypewriter", 100);
  // caricai i font creati in un array, in modo da poterne selezionare uno in modo casuale (in aggiornaSfondoETesto())
  fonts = new PFont[4];
  fonts[0] = didotBold200;
  fonts[1] = didotItalic200;
  fonts[2] = serif100;
  fonts[3] = at100;
}

void draw()
{
  aggiornaPosizioneDiDisegno();
  disegnaRettangolo();
}

void disegnaRettangolo()
{
  pushStyle();
  noStroke();
  fill(random(0, 255));
  rect(x, y, x, y);
  popStyle();
}

void aggiornaPosizioneDiDisegno()
{
  // disegna a partire dal centro --> rende la distribuzione dei rettangoli piu' uniforme sul canvas
  translate(semiLarghezza, semiAltezza);
  // spaziandoli in questo modo, i rettangoli sono un po' piu' diffusi, sul canvas
  x=(int)random(-semiLarghezza, semiLarghezza);
  y=(int)random(-semiAltezza, semiAltezza);
}

void mousePressed()
{
  aggiornaSfondoETesto();
}

void aggiornaSfondoETesto()
{
  // aggiorna sfondo
  background(255, 0, 0);

  // aggiorna scritta
  pushStyle(); // ** limita la formattazione grafica solo alla scritta, non ad altre parti del codice !
  fill(0); // testo color nero
  int fontIndex = (int)random(fonts.length); // scegli un font a caso tra i 4 disponibili
  textFont(fonts[fontIndex]); // settalo come font attivo
  text("Ciao!", -semiLarghezza, 0); // mostra la scritta (la posizione e' rispetto al centro del canvas, grazie al translate)
  popStyle(); // fine dell'ambiente a formattazione riservata **
}
