import themidibus.*;

final int MIN_MIDI_VALUE = 0;
final int MAX_MIDI_VALUE = 127;
int CENTER_X, CENTER_Y;

int diam_midi = 1;
int r_midi = 0;
int g_midi = 0;
int b_midi = 0;

MidiBus mb;
final static int KNOB_1 = 10;
final static int KNOB_6 = 15;
final static int KNOB_7 = 16;
final static int KNOB_8 = 17;

void setup()
{
  size(820, 820);

  CENTER_X = width/2;
  CENTER_Y = height/2;
  
  noStroke();
  fill(0, 0, 255);

  //MidiBus.list();
  mb = new MidiBus(this, 0, 1);
}

void draw()
{
  background(255);
  fill(r_midi, g_midi, b_midi);
  ellipse(CENTER_X, CENTER_Y, diam_midi, diam_midi);
}

// ATTENZIONE !
// Impostare una variabile globale, in questo caso diam_midi,
// e poi usarla in draw() ! Non provare a disegnare dentro a questa funzione, altrimenti
// non disegna nulla !
//
// La funzione viene chiamata di continuo per noi: quindi stiamo in ascolto
// sui valori giusti e poi li usiamo per modificare opportunamente il nostro sketch !
void controllerChange(int channel, int number, int value)
{
  if (channel == 0)
  {
    // set the size
    if (number == KNOB_1)
    {
      diam_midi = (int)map(value, MIN_MIDI_VALUE, MAX_MIDI_VALUE, 1, height);
      println(value);
    }

    // set the color
    switch (number)
    {
      case KNOB_6:
        r_midi = map_midi_color(value);
        break;
      case KNOB_7:
        g_midi = map_midi_color(value);
        break;
      case KNOB_8:
        b_midi = map_midi_color(value);
        break;
    }
  }
}

int map_midi_color(int value)
{
  return (int)map(value, MIN_MIDI_VALUE, MAX_MIDI_VALUE, 1, 255);
}
