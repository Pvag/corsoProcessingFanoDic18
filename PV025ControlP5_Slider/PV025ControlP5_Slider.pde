import controlP5.*;

ControlP5 cp5;
int sliderValue, raggio, coloreCerchio;

void setup()
{
  size(400, 280);
  noStroke();
  
  cp5 = new ControlP5(this);

  // vedi documentazione per lo slider della libreria ControlP5 qui:
  // http://www.sojamo.de/libraries/controlP5/examples/controllers/ControlP5slider/ControlP5slider.pde
  cp5.addSlider("sliderValue")
     .setPosition(100, 10)
     .setRange(0, 200)
     .setCaptionLabel("colore sfondo")
     ;

  cp5.addSlider("raggio")
     .setPosition(100, 30)
     .setRange(0, 200)
     .setCaptionLabel("raggio")
     ;

  cp5.addSlider("coloreCerchio")
     .setPosition(100, 50)
     .setRange(0, 255/3)
     .setCaptionLabel("colore cerchio")
     ;
}

void draw()
{
  background(sliderValue);
  fill(coloreCerchio, coloreCerchio*2, coloreCerchio*3);
  ellipse(width/2, height/2 + 30, raggio, raggio);
}
