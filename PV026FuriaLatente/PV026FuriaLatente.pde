// Muovi il mouse a sinistra/destra/alto/basso per scoprire due facce di questo sketch:
// forme gommose, educate; forme spinose, indomabili ! Inaspettata complessita' dalla ripetizione
// di un pattern semplice ! La rotazione, assieme ad una opportuna traslazione, aggiunge sempre
// quel guizzo..!

float t;
final int delta = 12;
final float globalRotSpeed = 0.9;
int nQuad;

void setup()
{
  size(1000, 800);

  //noStroke(); // interessante anche la versione noStroke !
  nQuad = 360 / delta;  
  t = 0.;
}

void draw()
{
  background(255);
  
  fill(0);
  text("framerate: " + frameRate, width-150, height-10);

  translate(mouseX, mouseY);
  rotate(radians(t));

  disegnaAnello();
  
  //t += random(7.1) - 3.; // interessante la versione random !
  t += globalRotSpeed;
}

void disegnaAnello()
{
  // disegna la ruota di oggetti
  for (int i = 0; i < nQuad; i++)
  {
    rotate(radians(delta));
    fill(i*10);
    float arrotondamentoRettangoli = map(mouseY, 0, height, -100, 50); // NOTA: la versione negative ESPLODE graficamente!
    rect(mouseX-width/2, 0, 40, 40, arrotondamentoRettangoli);
  }
}
