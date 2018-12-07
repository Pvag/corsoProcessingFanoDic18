import controlP5.*;

ControlP5 cp5;
int sliderValue;

void setup()
{
  size(400, 280);
  cp5 = new ControlP5(this);

  // vedi documentazione per lo slider della libreria ControlP5 qui:
  // http://www.sojamo.de/libraries/controlP5/examples/controllers/ControlP5slider/ControlP5slider.pde
  cp5.addSlider("sliderValue")
     .setPosition(100, 10)
     .setRange(0, 200)
     .setCaptionLabel("colore sfondo")
     ;
}

void draw()
{
  background(sliderValue);
}
