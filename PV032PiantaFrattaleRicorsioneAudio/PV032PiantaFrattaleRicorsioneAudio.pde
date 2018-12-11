// pianta frattale ! Si apre con il volume del suono che ascolta !

import processing.sound.*;
Amplitude amp;
AudioIn in;
final float maxVolume = 0.03; // modificare qui per la sensibilita'

void setup()
{
  size(850, 800);
  
  frameRate(10);

  // audio
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}

void draw()
{
  background(255);
  translate(width/2, height);
  albero(250);
}

void albero(float altezza)
{
  //println(amp.analyze());
  float angolo = map(amp.analyze(), 0, maxVolume, 0, PI);

  if (altezza > 3)
  {
//    float angolo = map(mouseY, 0, height, 0, PI);
    
    // il ramo
    line(0, 0, 0, -altezza);
  
    translate(0, -altezza);
    
    float nuovaAltezza = 2.*altezza/3.;

    // rami sinistri
    pushMatrix();
    rotate(-angolo);
    albero(nuovaAltezza);
    popMatrix();

    // rami destri
    pushMatrix();
    rotate(angolo);
    albero(nuovaAltezza);
    popMatrix();
  } else return;
}
