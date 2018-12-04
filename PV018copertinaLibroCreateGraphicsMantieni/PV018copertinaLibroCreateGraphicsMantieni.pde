PGraphics drawingRefresh; // mostra l'oggetto che si sposta, prima di fissarlo
PGraphics drawingFisso; // fissa l'oggetto
int radius;
int oldMouseX, oldMouseY;
boolean neverClicked;
final int maxRadius = 180;
final int minRadius = 10;
final int greyLinea = 200;

void setup()
{
  size(1000, 300);
  drawingRefresh = createGraphics(width, height);
  drawingFisso = createGraphics(width, height);
  neverClicked = true;
}

void draw()
{
//  radius = (int)map(mouseX, 0, width, minRadius, maxRadius);
  radius = (int)( 180.*sin(((float)mouseX)/180.));
  if (!mousePressed) // l'utente muove il mouse senza fare click
  {
    // pulisci e disegna di continuo
    drawingRefresh.beginDraw();
    drawingRefresh.noStroke();
    drawingRefresh.fill(0, 0, 200, 100.0);
    drawingRefresh.background(140);
    drawingRefresh.ellipse(mouseX, mouseY, radius, radius);
    if (!neverClicked)
    {
      // disegna la linea congiungente i cerchi, NON permanente
      drawingRefresh.stroke(greyLinea);
      drawingRefresh.line(oldMouseX, oldMouseY, mouseX, mouseY);
    }
    drawingRefresh.endDraw();
  } else // l'utente ha fatto click
  {
    // fissa il cerchio solo se l'utente ha cliccato il mouse
    drawingFisso.beginDraw();
    drawingFisso.noStroke();
    drawingFisso.fill(0, 0, 200, 6.0);
    drawingFisso.ellipse(mouseX, mouseY, radius, radius);
    if (neverClicked)
    {
      neverClicked = !neverClicked;
    } else
    {
      // disegna la linea congiungente i cerchi, Permanente
      drawingFisso.stroke(greyLinea);
      drawingFisso.line(oldMouseX, oldMouseY, mouseX, mouseY);
    }
    oldMouseX = mouseX;
    oldMouseY = mouseY;
    drawingFisso.endDraw();
  }
  image(drawingRefresh, 0, 0);
  image(drawingFisso, 0, 0); // popola l'immagine con gli oggetti salvati
} // draw
