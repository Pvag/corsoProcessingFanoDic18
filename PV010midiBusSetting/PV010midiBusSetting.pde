// setting the midi keyboard

import themidibus.*;

final int POMELLO12 = 8;

MidiBus mb;

void setup()
{
  size(420, 360);

  MidiBus.list();
  mb = new MidiBus(this, 0, 1);
}

void draw()
{
}

void controllerChange(int channel, int number, int value)
{
  println(channel);
  // esempio
  if (number == POMELLO12)
  {
    background(value, value, 2*value);
  }
  println(number); // questo e' l'identificativo del knob i-esimo: v. console !
  println(value);
}
