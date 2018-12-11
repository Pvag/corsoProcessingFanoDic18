import processing.sound.*;
Amplitude amp;
AudioIn in;

void setup()
{
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  
  frameRate(4);
}

void draw()
{
  println(100*amp.analyze());
}
