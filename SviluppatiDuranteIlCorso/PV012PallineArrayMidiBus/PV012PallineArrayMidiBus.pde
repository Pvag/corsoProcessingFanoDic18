import themidibus.*;

MidiBus mb;

final int deltaXMax = 10; // velocita' max che una pallina qualsiasi potra' avere in direzione x
final int deltaYMax = 10; // velocita' max in y

int[] deltaX;
int[] deltaY;
// la coordinata ( x[i] , y[i] ) rappresenta il centro della pallina individuata dall'indice i
int[] x; // contenitore (treno) della x di ciascuna pallina
int[] y; // contenitore della y di ciascuna pallina

int diam; // diametro delle palline

int r_midi, g_midi, b_midi; // colorazione delle palline

final int MIN_MIDI_VALUE = 0;   // valore midi minimo  proveniente dal controller
final int MAX_MIDI_VALUE = 127; // valore midi massimo proveniente dal controller

// questi knob vanno eventualmente rimappati, con il/i vostro/i controller
// - il knob chiamato 1 sul deck del mio controller, viene letto come 10, da midibus
// *** (v. funzione controllerChange) ***
final static int KNOB_1 = 10;
final static int KNOB_6 = 15;
final static int KNOB_7 = 16;
final static int KNOB_8 = 17;

void setup()
{
  size(700, 400);

  noStroke();

  final int nPalline = 10;

  x = new int[nPalline];
  y = new int[nPalline];
  deltaX = new int[nPalline];
  deltaY = new int[nPalline];

  // inizializzazione di diametro e colore, fondamentale,
  // se non si collega un controller midi
  diam = 40;
  r_midi = 100;
  g_midi = 60;
  b_midi = 190;

  inizializzaDelta(deltaX, deltaY);
  inizializzaPalline(x, y);

  /* scommentare la riga di codice sotto per stampare nella console la lista dei device midi disponibili (in/out)
   (ricordarsi di installare i driver per la periferica midi in uso) */
  //MidiBus.list();

  // crea un oggetto di classe MidiBus, in ascolto (input) sul dispositivo midi
  // identificato dall'indice 0, nell'elenco dei dispositivi midi disponibili in ingresso (v.
  // ed uscita sul dispositivo midi 
  mb = new MidiBus(this, 0, 1);
}

void draw()
{
  background(255);
  disegnaPalline(x, y, diam);
  aggiornaPos(x, y, deltaX, deltaY);
}

// da fare solo una volta, nel setup:
// setta ad un valore random il valore della velocita'
// di ciascuna pallina (nota: sul piano x-y la velocita' ha 2 componenti, una in direzione x, una in y)
void inizializzaPalline(int[] x, int[] y)
{
  for (int i = 0; i < x.length; i++)
  {
    x[i] = int(random(diam/2+1+abs(deltaX[i]), width-diam/2-1-abs(deltaX[i])));
    y[i] = int(random(diam/2+1+abs(deltaY[i]), height-diam/2-1-abs(deltaY[i])));
  }
}

// disegna tutte le palline, nella loro posizione assunta in questo frame
void disegnaPalline(final int[] x, final int[] y, final int diam)
{
  fill(r_midi, g_midi, b_midi); // il colore deriva dal valore inviato dal controller midi
  for (int i = 0; i < x.length; i++)
  {
    ellipse(x[i], y[i], diam, diam);
  }
}

// aggiorna la posizione di ciascuna pallina, controllando opportunamente
// che non esca dal canvas nella sua interezza !
// Potrebbe al limite farlo, per pochi frame, a causa del fatto che setto
// il diametro da controller midi
void aggiornaPos(int[] x, int[] y, int[] deltaX, int[] deltaY)
{
  for (int i = 0; i < x.length; i++)
  {
    // controllo che la x (considerando anche il diametro della pallina) non sia fuori dal canvas
    // nota: puo' succedere che lo sia, perche' ho impostato la dimensione
    //       del diametro tramite il valore restituito dal controlle midi
    //       ed ho risolto la situazione usando la funzione valore assoluto abs()
    deltaX[i] = aggiornaDeltaBordi(x[i], deltaX[i], width);
    deltaY[i] = aggiornaDeltaBordi(y[i], deltaY[i], height);

    x[i] += deltaX[i]; // questa riga equivale a scrivere:  x[i] = x[i] + deltaX[i];
    y[i] += deltaY[i];
  }
}

// cambia il segno al delta solo se la pallina, nella sua interezza, e' uscita dal canvas
// - puo' succedere, perche' il diametro viene cambiato tramite controller midi: se l'operazione
// viene fatta quando la pallina e' vicino al bordo del canvas, puo' succedere che essa esca
// in parte da esso e il problema e' ora risolto, senza rimbalzi indesiderati, grazie all'uso di abs()
int aggiornaDeltaBordi(final int valore, int deltaValore, final int max)
{
  if (valore - diam/2 < 0) deltaValore = abs(deltaValore);
  else if (valore + diam/2 > max) deltaValore = -abs(deltaValore);
  return deltaValore;
}

// qui vengono inizializzati il deltaX ed il deltaY (cioe' le velocita' costanti,
// moto rettilineo uniforme)
// per ogni pallina (identificata univocamente dall'indice i)
void inizializzaDelta(int[] deltaX, int[] deltaY)
{
  for (int i = 0; i < deltaX.length; i++)
  {
    deltaX[i] = int(random(-deltaXMax, +deltaXMax));
    deltaY[i] = int(random(-deltaYMax, +deltaYMax));
  }
}

// *** (ecco la spiegazione segnalata nella parte alta del codice, nella zona di definizione delle variabili globali) ***
//
// Questa funzione si occupa di assegnare
// - il valore (value)
// - di un certo elemento (number)
// - di un certo controller (channel)
// ad una data variabile.
// Il number idenfitica dunque univocamente un pomello, ad esempio, o una leva, in un controller
// identificato a sua volta univocamente dal valore presente in channel.
void controllerChange(int channel, int number, int value)
{
  // come si fa ad usare questa funzione:
  //
  // questa funzione viene chiamata automaticamente da midibus ad ogni segnale derivante dal controller midi
  // connesso a midibus (v. riga 59)
  //
  // per sapere il valore di channel di un certo controller, e' sufficiente scommentare la riga qui sotto:
  // println(channel)
  // e muovere un pomello qualsiasi sul controller: nella console, si leggera' un valore, ad ogni movimento del pomello,
  // e quel valore corrisponde al valore del channel corrispondente al controller sul quale si trova quel pomello.
  // E' possibile ora commentare il println e capire perche' nella mia riga qui sotto ho usato lo 0, con l'intento di sapere
  // se il channel da cui deriva il segnale e' proprio quello del controller midi con cui ho creato questo sketch, cioe' lo 0
  if (channel == 0) // se il controller e' quello individuato dall'indice 0
  {
    
    // stesso procedimento per conoscere il number corrispondente ad un dato knob o altro controllo presente
    // sul mio controller midi
    //
    // una volta individuato il number corrispondente ad un certo pomello, ad esempio, posso scrivere un test di uguaglianza
    // simile a quello qui sotto:
    if (number == KNOB_1)
    {
      // posso infine usare il value di quel controllo, di quel particolare controller, per modificare parametri del mio sketch:
      // in questo esempio, setto il diametro delle palline tramite il knob 1 del mio controller, il quale e' visto come 0,
      // da midibus
      diam = (int)map(value, MIN_MIDI_VALUE, MAX_MIDI_VALUE, 1, height);
      println(diam);
    }

    // uso i knob 6, 7 e 8 per settare il valore di rosso, verde e blu
    switch (number) // switch e' una specie di if
    {
    case KNOB_6:
      r_midi = map_midi_color(value); // fai questo, in caso il pomello mosso sia il 6
      break; // ricordarsi il break, altrimenti anche i casi sotto vengono eseguiti !
    case KNOB_7:
      g_midi = map_midi_color(value); // il 7
      break;
    case KNOB_8:
      b_midi = map_midi_color(value); // l'8
      break;
    default:
      break;
    }
  }
}

// a partire da value, che va da 0 a 127 (in quanto viene dal controller midi),
// restituiscimi un valore che usero' come coordinata di colore, dunque voglio che vada da 1 a 255
// (ecco perche' uso map, in questa funzione)
int map_midi_color(int value)
{
  return (int)map(value, MIN_MIDI_VALUE, MAX_MIDI_VALUE, 1, 255);
}
