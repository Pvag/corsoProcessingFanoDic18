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
  if (mousePressed)
  {
    pupinoOcchiolino(mouseX, mouseY); // per disegnare un pupino mi basta 1 riga di codice, anziche 4 !
  }
  else
  {
    pupino(mouseX, mouseY, 10);
  }
}

// per disegnare un pupino servono effettivamente 4 righe di codice,
// ma ora che ho la funzione pupino, chiamando la funzione,
// con una sola riga di codice (v. dentro la funzione draw),
// ottengo un pupino !
//
// x ed y sono le coordinate del centro del pupino 
void pupino(int x, int y, int scala)
{
  ellipse(x, y, 5*scala, 5*scala); // faccia
  ellipse(x-10, y-10, 2*scala, 2*scala); // occhio sinistro
  ellipse(x+10, y-10, 2*scala, 2*scala); // occhio destro
  ellipse(x, y+20, 1*scala, 1*scala); // bocca
}

void pupinoOcchiolino(int x, int y)
{
  ellipse(x, y, 50, 50); // faccia
  line(x-15, y-8, x-5, y-8); // occhiolino (sinistro)
  ellipse(x+10, y-10, 10, 10); // occhio destro
  ellipse(x, y+20, 5, 5); // bocca
}
