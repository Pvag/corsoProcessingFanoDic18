filippo Avatar
Dec 10, 2018 21:19:14 GMT 1 filippo said:
così dovrebbe andare.
Non riesco a capire perché la prima volta che clicco l'animazione si stoppa per 2 secondi...
Stesso problema che c'era nel codice di Lorenzo: alla prima apparizione del testo, Processing deve prima caricare il font con cui renderizzare il testo e questa operazione richiede tempo; nella versione qui sotto (ho solo aggiunto 2 righe e cambiato una esistente e tolto un'altra, mi pare), pre-carico il font in setup(), così quando arriva il momento che l'utente faccia click con il mouse, non ci sono blocchi ! (La tecnica di caricare roba solo al momento preciso in cui serve, come fa Processing nel tuo esempio, si chiama “lazy instantiation”.)

Figo questo sketch, Filo ! Congratulazioni, ancora !!

float [] x;
float [] y;
float [] xDelta;
float [] yDelta;
int numOfBalls = 50;
color [] colors = {color(0), color(255)};
PFont fontFigo;

void setup () {
  size (600, 600);
  frameRate (60);

  x = new float [numOfBalls];
  y = new float [numOfBalls];
  xDelta = new float [numOfBalls];
  yDelta = new float [numOfBalls];
  
  fontFigo = createFont("Didot", 20); // Qui pre-carico il font, evitando la pausa al primo click ! Puoi cambiare font qui

  for (int i = 0; i < numOfBalls; i++) {
    x[i] = random(10, 590);
    y[i] = random(10, 590);
    xDelta[i] = random(-5, 5);
    yDelta[i] = random(-5, 5);
  }
}

void draw() {
  background(colors[(int) random(2)]);
  fill(colors[(int) random(2)]);
  stroke(colors[(int) random(2)]);
  strokeWeight(random(0, 100));

  for (int i = 0; i < numOfBalls; i++) {
    ellipse(x[i], y[i], 15, 15);
    x[i] = x[i] + xDelta[i];
    y[i] = y[i] + yDelta[i];

    if ((x[i] > width - 10) || (x[i] < 10)) {
      xDelta[i] = -xDelta[i];
    }

    if ((y[i] > width - 10) || (y[i] < 10)) {
      yDelta[i] = -yDelta[i];
    }
  }

  if (mousePressed == true) {
    textFont(fontFigo, 400);
    text("UA", 10, 400);
  }
}
