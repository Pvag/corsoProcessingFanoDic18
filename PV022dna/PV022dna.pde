final int nElements = 9;
float alpha = 0.0;
color particleColor;
boolean firstCall = true;
int[] lengths;

void setup()
{
  size(400, 400, P3D);
  frameRate(30);
  particleColor = color(0, 0, 255); // blue particles
}

void draw()
{
  background(0);
  
  // choose among the following structure types: dna, dnaSin, randomWidth
  // implement your structure, maybe re-using the structures already implemented !
  //
  // dna(width/2, height, nElements, alpha, 0.2, particleColor); // has a linear profile
  dnaSin(width/2, height, nElements, alpha, 0.2, 1, 80., particleColor); // has a sinusoidal profile
  //randomWidth(width/2, height, nElements, alpha, 0., particleColor);

  alpha += 0.1;
}

// draws a sort of a DNA molucule,
// made of nElements horizontal dipoles,
// starting from an angle of alpha0 at the bottom dipole,
// shifted by an angle of deltaAngle one from each other
void dna(final int x, final int y, final int nElements, final float alpha0, final float deltaAngle, color particleColor)
{
  for (int i = 0; i < nElements; i++)
  {
    horizontalDipole(x, y - 40*(1+i), 60, alpha0 + deltaAngle*i, particleColor);
  }
}

void dnaSin(final int x, final int y, final int nElements, final float alpha0, final float deltaAngle, final float freq, final float amplitude, color particleColor)
{
  for (int i = 0; i < nElements; i++)
  {
    final int amp = (int) ( amplitude*sin(freq*i) );
    horizontalDipole(x, y - 40*(1+i), amp, alpha0 + deltaAngle*i, particleColor);
  }
}

void randomWidth(final int x, final int y, final int nElements, final float alpha0, final float deltaAngle, color particleColor)
{
  if (!firstCall)
  {
    for (int i = 0; i < nElements; i++)
    {
      horizontalDipole(x, y - 40*(1+i), lengths[i], alpha0 + deltaAngle*i, particleColor);
    }
  } else
  {
    lengths = new int[nElements];
    for (int i = 0; i < nElements; i++)
    {
      lengths[i] = (int)random(x);
    }
    firstCall = false;
  }
}

// draws a horizontal dipole (2 particles joined by a horizontal rod),
// centered at position x, y,
// the rod is long l,
// and the rotation about the y axis is rotY
void horizontalDipole(final int x, final int y, final int l, final float rotY, color particleColor)
{
  pushMatrix();
  translate(x, y);
  rotateY(rotY);
  final int x1 = -l/2;
  final int x2 =  l/2;
  stroke(255);
  line(x1, 0, x2, 0);
  translate(x1, 0);
  noStroke();
  lights();
  sphere(10);
  translate(l, 0);
  fill(particleColor);
  sphere(10);
  popMatrix();
}
