// un esempio di utilizzo graficamente interessante della funzione matematica seno

// cambia il colore dello sfondo in modo graduale,
// usando la funzione seno per far variare gradualmente
// le componenti rgb, ciascuna con una sua frequenza

// scommentando la riga con ellipse, si vede un altro uso
// della funzione matematica seno: il moto periodico, tipo
// pendolo o tipo molla

float t = 0.0;
float x = 0.0;
final int ampiezza = 280; // ampiezza del moto della pallina molleggiata
final float freqRosso = 0.1;
final float freqVerde = 0.8;
final float freqBlu = 1.5;

void setup()
{
  fullScreen();
}

void draw()
{
  // rosso con la sua frequenza
  float sinRosso = sin(freqRosso*t);
  int rosso = int(map(sinRosso, -1., 1., 0, 255));

  // verde con la sua frequenza
  float sinVerde = sin(freqVerde*t);
  int verde = int(map(sinVerde, -1., 1., 0, 255));
  
  // blu con la sua frequenza
  float sinBlu = sin(freqBlu*t);
  int blu = int(map(sinBlu, -1., 1., 0, 255));
  
  background(rosso, verde, blu);
  translate(width/2, height/2);
  
  x = ampiezza*sin(t);
  //ellipse(x, 0, 30, 30); // scommenta questo per vedere una pallina muoversi in modo "molleggiato"
  
  t += 0.01;
}
