// cast
//int a = 2;
//int b = 1;
//float c = 1;
//float d = 1.;

//println(b/a);
//println(b%a); // resto:
//println((int)c/a);
//println(c/a);
//println(d/a);

//println(10/7);
//println(10%7); // resto

//println(21/2);
//println(21%2);

void setup()
{
  noLoop();
}

void draw()
{
  pari(10);
  pari(11);
}

// operatore modulo %
// restituisce il resto della divisione intera
void pari(int n)
{
  if (n % 2 == 0) // il controllo di uguaglianza si fa con ==
  {
    println(n + " e' PARI!");
  }
  else
  {
    println(n + " e' DISPARI!");
  }
}
