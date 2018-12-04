// Come interagire con questo sketch:
// 1. premi il tasto play
// 2. muovi il mouse sul canvas
// 3. fai click col mouse

float deg = 0.00;
final float rotSpeed = 0.01;
float trailFadingSpeed = 6.0;

void setup()
{
  size(800, 300);
  noStroke();
}

void draw()
{
  fill(0, trailFadingSpeed);
  rect(0, 0, width, height);
  translate(mouseX, mouseY);
  rotate(deg);
  fill(20, 130, 255, 50);
  sqCenter(54);
  if (!mousePressed) deg += rotSpeed;
}

void sqCenter(int side)
{
  rect(-side/2, -side/2, side, side);
}
