void setup()
{
  size(400, 400);
}

void draw()
{
  if (mouseX < width/2 && mouseY < height/2) background(0); // zona in alto a sinistra
  else if (mouseX > width/2 && mouseY < height/2) background(255, 0, 0); // zona in alto a destra
  else if (mouseX < width/2 && mouseY > height/2) background(0, 255, 0); // zona in basso a sinistra
  else background(0, 0, 255); // zona in basso a destra
}
