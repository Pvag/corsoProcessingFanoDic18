PGraphics fisso; // mostra i cerchi memorizzati
PGraphics dinamico; // mosrtra il cerchio che segue il mouse

void setup()
{
  size(500, 300);
  fisso = createGraphics(width, height);
  dinamico = createGraphics(width, height);
}

void draw()
{
  dinamico.beginDraw();
  
  dinamico.background(100);
  dinamico.ellipse(mouseX, mouseY, 20, 20);
  
  dinamico.endDraw();
  
  if (mousePressed)
  {
    fisso.beginDraw();
    
    fisso.ellipse(mouseX, mouseY, 20, 20);
    
    fisso.endDraw();
  }
  
  image(dinamico, 0, 0);
  image(fisso, 0, 0);
}
