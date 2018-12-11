// esempio di utilizzo di array

// dichiara un treno dove ciascun "vagone" contiene il nome di uno dei partecipanti al corso:
// nomi[0] contiene "Filippo"
// nomi[3] contiene "Davide"
// nomi[1] contiene "Daniele"
// ...ecc
String[] nomi = {"Filippo", "Daniele", "Andrea", "Davide", "Lorenzo", "Paolo"};

void setup()
{
  size(400, 100);
  frameRate(1);
}

void draw()
{
  sorteggia();
}

void sorteggia()
{
  int numeroDiPartecipanti = nomi.length; // restituisce il numero di nomi presenti nell'array, cioe' 6
  int indice = (int)random(0, numeroDiPartecipanti); // genera un numero intero da 0 compreso, a 6 non compreso
  String nome = nomi[indice]; // seleziona il nome presente nell'array nomi all'indice i
  println(" E' stato estratto: " + nome); // stampa il nome sorteggiato
}
