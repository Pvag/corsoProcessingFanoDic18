float t1;
float t2;
float amp1, amp2;
float puls1, puls2;

void setup() {
  size(300, 300);
  background(0, 0, 255);
  
  amp1 = width/3.; // valore della ampiezza del moto della pallina 1
  amp2 = width/6.; // valore della ampiezza del moto della pallina 2
  
  puls1 = 1./20.; // valore della pulsazione del moto della pallina 1
  puls2 = 1./10.; // valore della pulsazione del moto della pallina 2
}

void draw() {
  tracceSeguiMouse();
}

void tracceSeguiMouse()
{
  permettiScia();

  translate(mouseX, mouseY); // segui mouse !

  stroke(255, 0, 0);
  strokeWeight(13);
  disegnaPuntoEsterno();
  disegnaPuntoInterno();
}

void disegnaPuntoEsterno()
{
  float nuovaX, nuovaY;
  // traccia esterna
  nuovaX = amp1*cos(puls1*t1);
  nuovaY = amp1*sin(puls1*t1);
  t1++;
  point(nuovaX, nuovaY);
}

void disegnaPuntoInterno()
{
  float nuovaX, nuovaY;
  // traccia interna
  nuovaX = amp2*sin(puls2*t2);
  nuovaY = amp2*cos(puls2*t2);
  t2++;
  point(nuovaX, nuovaY);
}

// permette la scia !
void permettiScia()
{
  noStroke();
  fill(0, 0, 255, 30.0); // blu trasparente
  rect(0, 0, width, height); // rettangolone blu
}
