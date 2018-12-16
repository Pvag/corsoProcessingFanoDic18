// esempio di programmazione ad oggetti:
// un villaggio ha un tot di abitanti,
// gli abitanti sono persone

Persona giorgio, antonellaclerici;
Villaggio fano;

int tempo = 1;

// TODO passare ad array

void setup()
{
  giorgio = new Persona(17, "Giorgio", 1.81);
  antonellaclerici = new Persona(200, "Antonella", 1.49);
  
  fano = new Villaggio(giorgio, antonellaclerici);
  
  noLoop();
  frameRate(1);
}

void draw()
{
  fano.appelloAbitanti();  
}

void esempio1()
{
  giorgio.saluta();
  giorgio.dimmiEta();
  //antonellaclerici.saluta();
  
  if (giorgio.maggiorenne()) println("Benvenuto nella nostra discoteca!");
  else println("Ci rivediamo piu' avanti...");
  
  if (tempo % 12 == 0) giorgio.compiAnni();
  
  tempo++;
}
