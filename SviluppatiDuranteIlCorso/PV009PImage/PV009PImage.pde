// NOTA: per eseguire questo sketch e' necessario
// salvare nella directory dello sketch una immagine
// chiamata io.jpg
PImage photo;
float alpha = 0.0;

void setup() {
  size(1000, 900);
  photo = loadImage("io.jpg");
  fill(255, 0, 0); // rosso - tutti rossi, eccetto dopo pushStyle !
}

void draw() {
  background(0, 0, 50);
  image(photo, 0, 0);
  rect(100, 0, 100, 100); // quadrato
  pushMatrix();
  pushStyle(); // solo 1 quadrato e' verde, gli altri tutti rossi
    fill(0, 255, 0); // verde
    rect(200, 0, 100, 100); // quadrato
  popStyle();
  // da qui in poi il cambio di riferimento avviene in un ambiente seprato
  translate(mouseX, mouseY);
  rotate(alpha);
  alpha += 0.1;
  image(photo, 0, 0);
  popMatrix();
  // da qui in poi il cambio di riferimento avviene nell'ambiente di base
}
