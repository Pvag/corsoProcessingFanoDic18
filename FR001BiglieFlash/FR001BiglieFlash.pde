float [] x;
float [] y;
float [] xDelta;
float [] yDelta;

void setup () {
  size (600, 600);
  frameRate (60);

  initPosAndDelta();
}

// initializes data for the position and the delta for each ball
void initPosAndDelta()
{
  final int numOfBalls = 50;

  x = new float [numOfBalls];
  y = new float [numOfBalls];
  xDelta = new float [numOfBalls];
  yDelta = new float [numOfBalls];

  for (int i = 0; i < numOfBalls; i++) {
    x[i] = random(10, 590);
    y[i] = random(10, 590);
    xDelta[i] = random(-3, 3);
    yDelta[i] = random(-3, 3);
  }
}

void draw() {
  background(0);
  setStyle();
  drawAndUpdate();
}

// draws this frame and updates coordinates for the next one
void drawAndUpdate()
{
  // INTERESTING NOTE
  // I can avoid declaring numOfBalls as a global variable !
  // I know how many balls I have to draw asking x how many elements it holds !
  final int numOfBalls = x.length;
  for (int i = 0; i < numOfBalls; i++) {
    ellipse(x[i], y[i], 20, 20);
    updatePos(i);
    updateDelta(i);
  }
}

// updates the position at index 'i' (i.e. updates the position of ball with index 'i')
void updatePos(final int i)
{
  x[i] = x[i] + xDelta[i];
  y[i] = y[i] + yDelta[i];
}

// updates the delta with index i
void updateDelta(final int i)
{
  updateDeltaX(i);
  updateDeltaY(i);
}

// updates the x component of delta with index i
void updateDeltaX(final int i)
{
  if ((x[i] > width - 10) || (x[i] < 10)) {
    xDelta[i] = -xDelta[i];
  }
}

// updates the y component of delta with index i
void updateDeltaY(final int i)
{
  if ((y[i] > width - 10) || (y[i] < 10)) {
    yDelta[i] = -yDelta[i];
  }
}

// sets the style for this frame
void setStyle()
{
  fill(random(0, 255), random(0, 255), random(0, 255));
  stroke(random(0, 255), random(0, 255), random(0, 255));
  strokeWeight(random(0, 100));
}
