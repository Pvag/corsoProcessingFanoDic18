float time, x; // posso dichiarare più variabili sulla stessa riga, se hanno lo stesso tipo
final float timeStep = 0.04; // se aumento questo, kit si muove piu' velocemente
final float larghezzaKit = 100.0; // di quanto si sposta kit rispetto al centro del canvas, tanto da un lato, quanto dall'altro

void setup()
{
  size(300, 100);
  background(0);
  noStroke();

  // faccio partire kit da 0 (cioe' dal centro dello schermo, visto che faccio un translate):
  // e' buona pratica iniziare le variabili globali (cioe' quelle dichiarate in alto)
  // dentro setup
  x = 0.0;
}

void draw()
{
  // trick per lasciare la scia
  scia();
  // disegna kit nel posto giusto dello schermo, per questo frame
  kitSeno();
}

void kitSeno()
{
  // e' bene usare pushMatrix e popMatrix, ogni volta che si voglia limitare l'effetto di operazioni
  // di traslazione o di rotazione del sistema di riferimento
  // alla sola porzione di codice da loro delimitata;
  // questo evita errori e/o comportamenti inaspettati dello sketch
  pushMatrix(); // **
  
  translate(width/2, height/2); // sposta il sistema di riferimento al centro del canvas
  
  // un utilizzo interessante, dal punto di vista grafico, della funzione matematica seno
  // ---
  // il valore restituito da sin sara' sicuramente tra -1 e +1, percio' lo amplifico con un moltiplicatore,
  // in modo che la x andra', al variare del tempo, da -larghezzaKit a +larghezzaKit, variando in maniera
  // piuttosto graduale tra i due valori estremi
  x = larghezzaKit * sin(time);
  fill(255); // ho scelto il bianco per kit, questa volta
  // nota, ora la coordinata y e' 0, in quanto il translate ha gia' posto il sistema di riferimento al centro del canvas !
  ellipse(x, 0, 20, 20); // ed ho scelto un cerchio al posto del quadrato
  
  // ora che ho disegnato il cerchio per il frame attuale, posso chiamare popMatrix(),
  // tornando dunque al sistema di riferimento di base, posizionato nell'angolo in alto a sinistra
  popMatrix(); // **
  
  // aggiorno il valore che verra' dato in input al seno alla prossima iterazione di draw (cioe' al prossimo frame):
  // questo mi portera' ad un valore di x diverso, grazie alla funzione seno, che cambia di continuo e gradualmente il valore che restituisce,
  // al cambiare del valore che riceve in input;
  time += timeStep;
}

// realizza la scia
void scia()
{
  fill(0, 6.0);
  rect(0, 0, width, height);
}
