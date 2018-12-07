class Bottone
{
  private int x, y, xEnd, yEnd;
  private String text;
  private boolean pressed;
  private int nLetters;

  Bottone(int x, int y, String text)
  {
    this.x = x;
    this.y = y;
    this.text = text;
    this.pressed = false;
    this.nLetters = text.length();
    this.xEnd = this.x + 10*this.nLetters;
    this.yEnd = this.y + 25;
  }

  void render()
  {
    if (!this.pressed)
    {
      pushStyle();
      fill(100);
      rect(x-4, y-4, 10*this.nLetters+8, 33);
      noStroke();
      fill(200);
      rect(x, y, 10*this.nLetters, 25);
      fill(0);
      text(text, x+5, y+15);
      popStyle();
    } else
    {
      pushStyle();
      fill(200);
      rect(x-4, y-4, 10*this.nLetters+8, 33);
      noStroke();
      fill(100);
      rect(x, y, 10*this.nLetters, 25);
      fill(255);
      text(text, x+5, y+15);
      popStyle();
    }
  }
  
  void checkPressed()
  {
    if (mouseX > this.x && mouseX < xEnd && mouseY > this.y && mouseY < yEnd)
    {
      this.pressed = !this.pressed;
    }
  }
}
