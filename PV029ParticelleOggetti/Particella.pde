class Particella
{
  private int x;
  private int y;
  private int radius;
  private int grey;
  private int velX, velY;
  
  Particella(int radius, int grey)
  {
    this.radius = radius;
    this.grey = grey;
    initVel();
    initPos();
  }
  
  void initPos()
  {
    this.x = 200;
    this.y = 200;
  }
  
  void initVel()
  {
    this.velX += (int)random(5) - 3;
    this.velY += (int)random(5) - 3;
  }
  
  void moveRandom()
  {
    this.x += (int)random(3) - 1;
    this.y += (int)random(3) - 1;
  }
  
  void moveBordi()
  {
    if (this.x > width - this.radius/2 || this.x < this.radius/2) this.velX = - this.velX;
    if (this.y > height - this.radius/2 || this.y < this.radius/2) this.velY = - this.velY;
    this.x += this.velX;
    this.y += this.velY;
  }
  
  void update()
  {
    pushStyle();
    noStroke();
    fill(this.grey);
    ellipse(this.x, this.y, this.radius, this.radius);
    popStyle();
  }
  
  void listProp()
  {
    println(" Particle - radius: " + this.radius + "; x: " + this.x + "; y: " + this.y);
  }
}
