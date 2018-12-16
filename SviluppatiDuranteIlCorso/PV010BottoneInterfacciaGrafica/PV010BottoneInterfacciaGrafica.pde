final color coloreBottoneSollevato = color(220);
final color coloreBottonePremuto = color(80);
color coloreAttuale;
int inizioBottoneX, fineBottoneX, inizioBottoneY, fineBottoneY;
final int larghezzaBottone = 60;
final int altezzaBottone = 30;
final int centroX = 10;
final int centroY = 10;

void setup()
{
  size(400, 200);
  coloreAttuale = coloreBottoneSollevato;
  initDatiBottone(centroX, centroY);
}

void draw()
{
  background(255);
  renderizzaBottone(centroX, centroY);
}

// inizializza i dati del bottone (basta eseguirlo una volta, prima del draw)
void initDatiBottone(final int centroX, final int centroY)
{
  inizioBottoneX = centroX - larghezzaBottone/2;
  fineBottoneX   = centroX + larghezzaBottone/2;
  inizioBottoneY = centroY - altezzaBottone/2;
  fineBottoneY   = centroY + altezzaBottone/2;
}

// disegna il bottone a schermo usando il colore attuale
void renderizzaBottone(final int x, final int y)
{
  // PER CASA
  // aggiungere un triangolo tipo "play"
  settaColoreAttuale();
  fill(coloreAttuale);
  rect(x, y, larghezzaBottone, altezzaBottone);
}

// si occupa di impostare il colore attuale del bottone, in base al suo stato (premuto o sollevato)
void settaColoreAttuale()
{
  if (mousePressed)
  {
    if (mousePremutoSulBottone())
    {
      if (coloreAttuale == coloreBottoneSollevato) coloreAttuale = coloreBottonePremuto;
      else coloreAttuale = coloreBottoneSollevato;
    }
  }
}

// restituisce true, solo se il mouse si trova entro l'area del bottone 
boolean mousePremutoSulBottone()
{
  if (mouseX > inizioBottoneX && mouseX < fineBottoneX && mouseY > inizioBottoneY && mouseY < fineBottoneY)
    return true;
  else return false;
}
