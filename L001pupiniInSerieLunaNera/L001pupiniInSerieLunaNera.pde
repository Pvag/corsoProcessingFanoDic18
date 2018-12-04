int x = 30; // NOTA: non farlo partire da 0 altrimenti si blocca, perche' ci ho messo un controllo
          //       per far restare tutto il volto sempre tutto all'interno dello schermo
int vel = 1;
final int raggioFaccia = 50;

void setup()
{
  size(460, 380);
  background(0);
  color(0, 255);
}

void draw()
{
  disegnaSerie(); // ho creato una funzione apposta per radunare le varie chiamate a pupino,
                  // lasciando il main piu' pulito
  x = prossimaX(x);
}

void disegnaSerie()
{
  pupino2(x, 50);
  pupino2(x, height/2); // ora è chiara la potenza della funzione !
  pupino2(x, height-50); // per disegnare un pupino mi basta 1 riga di codice, anziche 4 !
}

int prossimaX(int xVecchia)
{
  if ( ( xVecchia > (width - raggioFaccia/2) ) || ( xVecchia < raggioFaccia/2 ) )
  {  
    vel = -vel;
  }
  //il nuovo valore della posizione orizz.
  return xVecchia + vel;
}

// x ed y sono le coordinate del centro del pupino 
void pupino(int x, int y)
{
  // ATTENZIONE: i valori dovrebbero andare da 0 a 255,
  //             per le funzioni stroke e fill !
  //             Ho risolto con questa modifica, oppure trovi un'altra modifica in pupino2
  stroke(x%255, y%255);
  ellipse(x, y, 50, 50); // faccia
  fill((x+1)%255);
  ellipse(x-10, y-10, 10, 10); // occhio sinistro
  fill((x+1)%255);
  ellipse(x+10, y-10, 10, 10); // occhio destro
  fill((x+1)%255);
  ellipse(x, y+20, 5, 5); // bocca
  fill(0);
  ellipse(x-9, y-9, 5, 5);//pupilla sx
  ellipse(x+9, y-9, 5, 5);//pupilla dx
}

void pupino2(int x, int y)
{
  // Ti consiglio questo approccio: la funzione map
  // estende (o contrae) il range espresso dai primi 2 numeri dopo la x,
  // trasformandolo nel range espresso dagli ultimi 2 parametri !
  // In questo caso, map estende il valore di x, che sara' di base da 0 a width,
  // in un valore plausibile della scala di grigi, cioe' un valore da 0 a 255.
  // Map e' la mia funzione preferita di Processing, credo !
  // Trovi di piu' su map, nella reference - ovviamente !
  int grigio = (int)map(x, 0, width, 0, 255);
  stroke(grigio);
  ellipse(x, y, raggioFaccia, raggioFaccia); // faccia
  fill(grigio);
  ellipse(x-10, y-10, 10, 10); // occhio sinistro
  fill(grigio);
  ellipse(x+10, y-10, 10, 10); // occhio destro
  fill(grigio);
  ellipse(x, y+20, 5, 5); // bocca
  fill(0);
  ellipse(x-9, y-9, 5, 5);//pupilla sx
  ellipse(x+9, y-9, 5, 5);//pupilla dx
}

//se clicchi sulla finestra il background cambia colore
void mousePressed()
{
  // interessante e divertente questa scelta per il colore di background ! Bravo !
  background(color(mouseX, 0, mouseY, 3));
}
