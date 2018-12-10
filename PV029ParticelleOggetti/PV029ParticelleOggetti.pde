// Un gioco di bolle ! Usa i tasti '+' e '-' della tastiera per giocare !

import processing.sound.*;
SoundFile pop, newBubble; // hai notato come ho caricato i file audio con gli effetti sonori ?

final int maxRadius = 100;
final int nParticelleIniziale = 2;
int prevTime;

Particella[] particelle;

void setup()
{
  size(600, 300);

  prevTime = millis();

  pop = new SoundFile(this, "pop.mp3"); // carico l'effetto esplosione bolla
  newBubble = new SoundFile(this, "newBubble.mp3"); // carico l'effetto formazione nuova bolla

  particelle = new Particella[nParticelleIniziale];

  creaParticelle(particelle);
}

void draw()
{
  gioca();
}

// Un gioco di bolle ! Usa + e - per giocare !
void gioca()
{
  background(255);
  updateParticelle();
}

void creaParticelle(Particella[] particelle)
{
  for (int i = 0; i < particelle.length; i++)
  {
    particelle[i] = new Particella(int(random(1, maxRadius)), (int)random(255));
  }
}

void updateParticelle()
{
  if (keyPressed) antiRimbalzo();
  for (Particella particella : particelle)
  {
    //particella.moveRandom(); //questo movimento o il seguente, sono disponibili
    particella.moveBordi();
    particella.update();
  }
}

void antiRimbalzo()
{
  final int timeBetweenClicks = 100; // 100 ms means 1/10 of a second
  int now = millis();
  int deltaT = now - prevTime;
  if (deltaT > timeBetweenClicks)
  {
    if (key == '+')
    {
      newBubble.play(); // suona l'effetto sonora di formazione nuova bolla
      Particella p = new Particella((int)random(1, 80), (int)random(255));
      particelle = (Particella[])append(particelle, p);
    } else if (key == '-')
    {
      if (particelle.length > 0)
      {
        pop.play(); // suona l'effetto sonoro di esplosione bolla
        particelle = (Particella[])shorten(particelle);
      }
    }
    prevTime = now;
  }
}
