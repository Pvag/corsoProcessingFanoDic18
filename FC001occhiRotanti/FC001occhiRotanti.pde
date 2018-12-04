// Modifiche
// ---------
//
// Paolo - 04/12/18 h 21:57
// -----
// Ho pulito un po' il codice, sistemato la rotazione dell'occhio destro
// e lasciato commenti qui e la' per spiegare il tutto !
// Buon laovoro, congratulazioni !

// Iniziale
// ---
// ho disegnato un pupino su un' immagine come background e delle linee che ruotano in senso orario e antiorario

float alphaOrario = 0.0;
float alphaAntiorario = 0.0;
PImage photo;
final int raggioOcchio = 80;
final int xSinistro = 135;
final int xDestro = 365;

void setup()
{
  size(500, 500);
  photo = loadImage("tt.jpg"); // TODO inserire nome della tua immagine locale !
  stroke(255, 0, 0);
}

void draw()
{
  disegnaImmagineStatica();  
  ruotaOcchi();
}

void disegnaImmagineStatica()
{
  image(photo, 0, 0); // sfondo

  // pupino
  pushStyle();
  fill(255);
  stroke(0);
  pupino(0, 0);
  popStyle();
}

// ho creato una funzione che ruota entrambi gli occhi
void ruotaOcchi()
{
  ruota(xSinistro, alphaAntiorario); // il sinistro
  ruota(xDestro, alphaOrario); // il destro
  alphaOrario += 0.05;
  alphaAntiorario -= 0.05;
}

// questo ruota e' generico, per un occhio qualsiasi,
// infatti non e' buona pratica fare un codice praticamente identico in 2 funzioni
// diverse: gli occhi sono 2, ma differiscono di 2 soli parametri: la posizione del loro
// centro e l'angolo di rotazione ! Dunque, e' meglio implementare una funzione, chiamata qui ruota,
// che si prenda cura di creare un occhio generico
void ruota(int x, float alpha)
{
  pushMatrix(); // notare che il pushmatrix l'ho messo direttamente qui e non in draw !
                // il draw sarebbe meglio lasciarlo come ambiente piu' astratto, senza i dettagli;
                // i dettagli poi li mettiamo nelle specifiche funzioni, che realizzano il comportamento
                // di dettaglio desiderato
  translate(x, 200);
  rotate(alpha);
  line(0, 0, raggioOcchio, raggioOcchio);
  line(0, 0, -raggioOcchio, -raggioOcchio);
  popMatrix();
}

void pupino(int x, int y)
{
  x = 250;
  y = 250;
  ellipse(x, y, 480, 480); // faccia
  ellipse(135, 200, 230, 230); // occhio sinistro
  ellipse(365, 200, 230, 230); // occhio destro
  line(20, 315, 480, 315); // bocca
  line(250, 490, 204, 315);
  line(158, 472, 204, 315);
  line(158, 472, 112, 315);
  line(66, 405, 112, 315);
  line(66, 405, 20, 315);
  line(250, 490, 294, 315);
  line(342, 472, 294, 315);
  line(342, 472, 386, 315);
  line(434, 405, 386, 315);
  line(434, 405, 480, 315);
}
