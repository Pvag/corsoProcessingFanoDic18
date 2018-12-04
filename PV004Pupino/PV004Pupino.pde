// Una base per un po' di giochi:
// disegna un esercito di PUPINI !

// cose da fare:
// 1. Il corpo dei pupini !
// 2. Aggiungere altri pupini nel canvas
// 3. Colorare i pupini !
// 4. Inventa le tue modifiche !

void setup()
{
  size(800, 600);
}

void draw()
{
  pupino(100, 100);
  pupino(200, 100); // ora è chiara la potenza della funzione !
  pupino(300, 100); // per disegnare un pupino mi basta 1 riga di codice, anziche 4 !
}

// per disegnare un pupino servono effettivamente 4 righe di codice,
// ma ora che ho la funzione pupino, chiamando la funzione,
// con una sola riga di codice (v. dentro la funzione draw),
// ottengo un pupino !
//
// x ed y sono le coordinate del centro del pupino 
void pupino(int x, int y)
{
  ellipse(x, y, 50, 50); // faccia
  ellipse(x-10, y-10, 10, 10); // occhio sinistro
  ellipse(x+10, y-10, 10, 10); // occhio destro
  ellipse(x, y+20, 5, 5); // bocca
}
