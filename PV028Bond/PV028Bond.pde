// Generate quite complex shape, starting from a pretty simple rule:
// translate to the center of the canvas;
// rotate;
// translate a bit on the right;
// draw a line !

// The line has the y of its origin, ranging from -200 to +200, following mouseY;
// the number of lines drawn is set accordingly to mouseX, ranging from 5 to 60.

float rot, deltaRot;

void setup()
{
  size(400, 400);  
  rot = 0.;
}

void draw()
{
  eye();
}

void eye()
{
  int nEl = (int)map(mouseX, 0, width, 5, 60);
  deltaRot = 360./nEl;
  int shift = (int)map(mouseY, 0, height, -200, 200);

  background(255);
  translate(width/2, height/2);
  for (int i = 0; i < nEl; i++)
  {
    pushMatrix();
    rotate(radians(rot));
    translate(50, 0);
    line(0, shift, 40, 0);
    popMatrix();
    rot += deltaRot;
  }
}
