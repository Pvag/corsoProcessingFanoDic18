// Compiti per Casa:
// #010 - Una linea di cerchi

// Creare una linea orizzontale di cerchi, in posizione fissa,
// usando un array per memorizzarne le posizioni
// ed usando un loop for per inizializzarne le posizioni
// ed un altro loop for per disegnare tutti i cerchi in una volta sola nel canvas.

// Post sul forum: http://esplora.freeforums.net/thread/54/010-una-linea-di-cerchi

// Codice su GitHub: https://github.com/Pvag/corsoProcessingFanoDic18/tree/master/CompitiPerCasa/CPC_010_lineaDiCerchi

int[] x, y;
final int nCerchi = 8;
final int diam = 30;

void setup()
{
  size(360, 150);
  initPos();
}

void draw()
{
  disegnaCerchi();
}

void initPos()
{
  x = new int[nCerchi];
  y = new int[nCerchi];
  x[0] = 50;
  y[0] = 60;
  for (int i = 1; i < x.length; i++)
  {
    x[i] = x[i-1] + diam;
    y[i] = 60;
  }
}

void disegnaCerchi()
{
  for (int i = 0; i < x.length; i++)
  {
    ellipse(x[i], y[i], diam, diam);
  }
}
