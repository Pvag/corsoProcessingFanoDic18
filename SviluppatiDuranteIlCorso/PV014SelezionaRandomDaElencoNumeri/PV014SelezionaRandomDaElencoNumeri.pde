// pesca un numero a caso da un gruppo di numeri

int[] numeri = {10, 20, 30};

void setup()
{
  size(100, 100);
  
  frameRate(1);
}

void draw()
{
  int numero = pescaRandom();
  println(numero);
}

int pescaRandom()
{
  int indice = int(random(0, numeri.length));
  int numeroEstratto = numeri[indice];
  return numeroEstratto;
}
