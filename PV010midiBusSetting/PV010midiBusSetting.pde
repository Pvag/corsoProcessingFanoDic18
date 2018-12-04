// setting the midi keyboard

import themidibus.*;

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
  println(number); // questo e' l'identificativo del knob i-esimo: v. console !
  println(value);
}
