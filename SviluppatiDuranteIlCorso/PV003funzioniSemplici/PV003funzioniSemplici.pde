// variabili globali
int base = 10;

void setup()
{
  int doppio = raddoppia(4); // doppio e' una variabile locale
  println(doppio);
  println(raddoppia(12)); // annidare le chiamate di funzione

  println(base);
  raddoppiaBase();
  println(base);  
}

int raddoppia(int n)
{
  int risultato = n + n;
  return risultato;
}

void raddoppiaBase()
{
  base = base + base;
}
