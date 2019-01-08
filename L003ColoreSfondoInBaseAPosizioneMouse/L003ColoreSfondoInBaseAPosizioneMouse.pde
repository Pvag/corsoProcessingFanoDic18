private final color red=color(255, 0, 0), green=color(0, 255, 0), blue=color(0, 0, 255), black = color(0);

void setup()
{
  size(900, 600);
  noStroke(); // con questo lo sketch e' piu' piacevole, secondo me
}

void draw()
{
  disegnaRettangoloSeguendoMouse();
}

void disegnaRettangoloSeguendoMouse() {
  background(255); // pulisci lo schermo ad ogni frame
  
  if (mouseIsInTopLeftQuadrant())
  {
    fill(black);
    rect(0, 0, width/2, height/2);
  }
  else if (mouseIsInTopRightQuadrant()) 
  {
    fill(green);
    rect(width/2, 0, width, height/2);
  }
  else if (mouseIsInBottomLeftQuadrant())
  {
    fill(blue);
    rect(0, height/2, width/2, height);
  }
  else // questo lo ottieni gratis, senza controllo logico, se usi if/else if/else
  {
    fill(red);
    rect(width/2, height/2, width, height);
  }
}

boolean mouseIsInTopLeftQuadrant() {
  // questo e' un modo per implementare questo tipo di funzione;
  // un modo equivalente e' quello implementato in topRight,
  // cioe' usando direttamente il return, al posto di if/else
  if (mouseX < width/2 && mouseY < height/2) return true;
  else return false;
}

boolean mouseIsInTopRightQuadrant()
{
  return (mouseX > width/2 && mouseY < height/2); // returns true or false
}

boolean mouseIsInBottomLeftQuadrant()
{
  return (mouseX < width/2 && mouseY > height/2);
}

// il bottomRight lo ottieni 'gratis', cioe' ad esclusione, grazie al
// costrutto if/else if/else
