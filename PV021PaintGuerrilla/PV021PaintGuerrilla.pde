// ------------------------------------------------------------------------------------------------- //<>//
//                   Alcuni esercizi di manipolazione di immagine con Processing
//
// E' consigliato salvare una immagine di 500x500 pixel e nome imm.jpg nella directory dello sketch.
// -------------------------------------------------------------------------------------------------

import controlP5.*;

final String nomeFileFoto = "imm.jpg";
Bottone bottoneSelezionaColore, colorPicker;
int elapsed, lastValidClickTime;
boolean runDemoSelezionaColore, modalitaSelezionaColore, modalitaColorPicker;
ControlP5 sensitivitaSlider, rgbSliders;
int sliderSensitivita, sliderR, sliderG, sliderB;
final int largBandaPulsanti = 200;
final int x0 = largBandaPulsanti;
final int millisAntiRimbalzo = 400;
PImage immOrig, immMod;
color lastColor;

void setup()
{
  size(1200, 500);
  //noLoop();

  sensitivitaSlider = new ControlP5(this);
  sensitivitaSlider.addSlider("sliderSensitivita")
    .setPosition(20, 60)
    .setRange(1, 100)
    .setCaptionLabel("sensitivita")
    ;

  rgbSliders = new ControlP5(this);
  rgbSliders.addSlider("sliderR")
    .setPosition(20, 80)
    .setRange(1, 255)
    .setCaptionLabel("R")
    ;

  rgbSliders.addSlider("sliderG")
    .setPosition(20, 100)
    .setRange(1, 255)
    .setCaptionLabel("G")
    ;

  rgbSliders.addSlider("sliderB")
    .setPosition(20, 120)
    .setRange(1, 255)
    .setCaptionLabel("B")
    ;

  bottoneSelezionaColore = new Bottone(20, 20, "Seleziona Colore");
  colorPicker = new Bottone(20, 140, "Sel. con Mouse");
  elapsed = 0;
  lastValidClickTime = 0;
  runDemoSelezionaColore = false;
  modalitaSelezionaColore = false;
  modalitaColorPicker = false;
  sliderSensitivita = 0;

  immMod = loadImage(nomeFileFoto);

  lastColor = color(100, 100, 100);

  pulisciBackground();
}

void draw()
{
  ascoltaClick();

  if (modalitaSelezionaColore)
  {
    mostraInterfacciaSelezionaColore();
    //int sensitivity = (int) map(mouseX, 0, width, 1, 100);
    //if (picker.clicked) color c = picker.getColor();
    //color col;
    //if (isPickingColor(colorPicker)) {
    //  colorPicker.render();
    //} else
    //{
    //  col = color(sliderR, sliderB, sliderG);
    //}
    //demoSelezionaColore(col, immOrig);
    rgbSliders.setVisible(true);
    if (modalitaColorPicker)
    {
      rgbSliders.setVisible(false); // IMPLEMENTARE !
      if (mousePressed && mouseX > x0)
      {
        lastColor = getColorUnderCursor();
      }
      immMod = selezionaColore(immOrig, immMod, lastColor, sliderSensitivita);
    } else
    {
      immMod = selezionaColore(immOrig, immMod, color(sliderR, sliderG, sliderB), sliderSensitivita);
    }
    mostraImmMod();
  } else
  {
    pulisciBackground();
    rgbSliders.setVisible(false);
    sensitivitaSlider.setVisible(false);
  }

  mostraInterfacciaBase();
  immOrig = showOriginalImage();
}

PImage showOriginalImage()
{
  PImage immOrig = loadImage(nomeFileFoto);
  image(immOrig, x0, 0); 
  return immOrig;
}

boolean isPickingColor(Bottone colorPicker)
{
  if (colorPicker.pressed) return true;
  else return false;
}

color getColorUnderCursor()
{
  return get(mouseX, mouseY);
}

void pulisciBackground()
{
  background(100);
}


//////////
//PImage immMod = createImage(immOrig.width, immOrig.height, RGB);


void mostraInterfacciaBase()
{
  bottoneSelezionaColore.render();
}

void mostraInterfacciaSelezionaColore()
{
  sensitivitaSlider.setVisible(true);
  colorPicker.render();
}

void aggiornaInterfacciaDiBottoni()
{
  mostraInterfacciaBase();
  mostraInterfacciaSelezionaColore();
}

// Funge da meccanismo "anti-rimbalzo"
// E' necessario, perche' quello che per noi e' un click rapido, per processing sono click ripetuti
// in molti frame, tanti di piu', quanto maggiore e' la frequenza di aggiornamento (frameRate).
void ascoltaClick()
{
  if (mousePressed) // se il mouse e' stato premuto
  {
    int now = millis(); // il tempo assoluto (rispetto al lancio dello sketch)
    elapsed = now - lastValidClickTime; // conta quanti millisecondi sono trascorsi dall'ultimo click
    if (elapsed > millisAntiRimbalzo) // se dall'ultimo click e' trascorso piu' di mezzo secondo (500 millisecondi)
    {
      bottoneSelezionaColore.checkPressed(); // allora aggiorna il bottone
      if (bottoneSelezionaColore.pressed)
      {
        modalitaSelezionaColore = true;
        colorPicker.checkPressed();
        if (colorPicker.pressed) modalitaColorPicker = true;
        else modalitaColorPicker = false;
      } else 
      {
        modalitaSelezionaColore = false;
        modalitaColorPicker = false;
      }

      lastValidClickTime = now; // tieni traccia del tempo attuale
    }
  }
}

void mostraImmMod()
{
  image(immMod, immOrig.width+x0, 0);
}

PImage selezionaColore(PImage immOrig, PImage immMod, color desiredColor, int range)
{
  immOrig.loadPixels();
  immMod.loadPixels();
  color averageRGB;
  final int nPixels = immOrig.width*immOrig.height;
  for (int i = 0; i < nPixels; i++)
  {
    color colorOfThisPixel = immOrig.pixels[i];
    averageRGB = (int) ( ( red(colorOfThisPixel) + green(colorOfThisPixel) + blue(colorOfThisPixel) )/3. );
    if (inRange(colorOfThisPixel, desiredColor, range))
    {
      immMod.pixels[i] = immOrig.pixels[i];
    } else
    {
      immMod.pixels[i] = color(averageRGB, averageRGB, averageRGB);
    }
  }
  immMod.updatePixels();
  return immMod;
}

boolean inRange(color colorOfThisPixel, color desiredColor, int range)
{
  if (abs(red(colorOfThisPixel) - red(desiredColor)) < range && abs(green(colorOfThisPixel) - green(desiredColor)) < range && abs(blue(colorOfThisPixel) - blue(desiredColor)) < range)
  {
    return true;
  } else return false;
}

void demoVarianteConTono()
{
  PImage immOrig = loadImage(nomeFileFoto);
  image(immOrig, 0, 0); // mostra l'immagine originale in alto a sinistra

  PImage immMod;

  immMod = varianteConTono(immOrig, "rosso"); // l'immagine con variante rossa
  image(immMod, width/2, 0); // in alto a destra

  immMod = varianteConTono(immOrig, "blu"); // l'immagine con variante blu
  image(immMod, 0, height/2); // in basso a sx

  immMod = varianteConTono(immOrig, "grigio"); // l'immagine con variante bianco/nero
  image(immMod, width/2, height/2); // in basso a dx

  immMod = varianteConTono(immOrig, "verde"); // l'immagine con variante verde
  immMod.resize(300, 180); // rimpicciolita
  image(immMod, width/2-immMod.width/2, height/2-immMod.height/2); // al centro, sopra le altre
}

/**
 * Mostra a sinistra l'immagine originale, a destra la sua versione specchiata rispetto all'asse verticale centrale
 */
void demoSpecchiamento()
{
  PImage immOrig = loadImage(nomeFileFoto);
  image(immOrig, 0, 0); // mostra l'immagine originale in alto a sinistra

  PImage specchiataOriz = specchiaOrizzontalmente(immOrig);
  image(specchiataOriz, width/2, 0);
}

// Restituisce una nuova immagine, uguale alla immagine presente in im, ma specchiata orizzontalmente,
// cioe' specchiata rispetto all'asse verticale centrale
PImage specchiaOrizzontalmente(final PImage im)
{
  PImage newIm = createImage(im.width, im.height, RGB); // crea lo spazio in memoria per una nuova immagine
  newIm.loadPixels(); // carica i pixel della nuova immagine in un array di pixel
  im.loadPixels(); // carica i pixel della immagine originale in un altro array di pixel
  // per ogni riga
  final int nPixelsMezzaImmagine = im.width/2; // numero di pixel orizzontali di meta immagine
  int pixelAttuale, pixelCorrispondente;
  for (int row = 0; row < im.height; row++) // per ogni riga dell'immagine
  {
    int nPixelFinoQuestaRiga = im.width * row; // pixel esistenti nelle righe sopra questa
    // swappa il pixel i con quello (width - i)
    for (int col = 0; col < nPixelsMezzaImmagine; col++) // per ogni colonna
    {
      pixelAttuale = nPixelFinoQuestaRiga + col;
      pixelCorrispondente = nPixelFinoQuestaRiga + (im.width - col) - 1; // trick !
      newIm.pixels[pixelAttuale] = im.pixels[pixelCorrispondente]; // aggiorna il pixel di sinistra con quello precedente di destra
      newIm.pixels[pixelCorrispondente] = im.pixels[pixelAttuale]; // aggiorna il valore del pixel di destra con quello di sinistra
    }
  }
  newIm.updatePixels(); // ora aggiorno i pixel della nuova immagine

  return newIm;
}

/** Restituisce una immagine con i colori modificati, virati verso 'tono'.
 *  L'immagine originale e' fornita in input, gia' caricata nella variabile PImage 'foto'.
 *  Ricorda: metti il file con l'immagine originale nella cartella di questo sketch !
 *
 * @param foto : l'immagine originale dalla quale calcolare le modifiche colore
 * @param tono : il tono verso cui virare i colori dell'immagine
 * @return una nuova immagine, con colori corrispondenti al tono scelto
 */
PImage varianteConTono(PImage foto, String tono)
{
  PImage fotoMod = createImage(foto.width, foto.height, RGB);
  foto.loadPixels();
  int numeroDiPixelDellImmagine = foto.width * foto.height;
  // passa in rassegna ciascun pixel dell'immagine:
  // immagina di mettere in fila tutti i pixel che compongono l'immagine,
  // in modo che se l'immagine fosse formata dai valori numerici
  // 1   30 42 100
  // 40 200 39  80
  // si avrebbe una riga sola, un serpentone di numeri:
  // 1   30 42 100 40 200 39  80
  // che e' piu' facile da passare in rassegna in un ciclo for unico
  // (alla fine, il serpentone viene riasseblato in una immagine aggiornata, con updatePixels(), v. sotto)
  for (int i = 0; i < numeroDiPixelDellImmagine; i++)
  {
    // prendi il suo colore
    color rgb  = foto.pixels[i]; // ottengo il colore rgb del pixel i-esimo
    // calcola la media delle componenti di colore del pixel i-esimo dell'immagine
    int media = (int)( red(rgb) + green(rgb) + blue(rgb) ) / 3; // calcolo il grigio come media di r, g e b
    // nota, questo switch e' simile al costrutto if gia' visto
    // p.s. si sarebbe potuto evitare di metterlo qui, per questioni di efficienza, ma per ora va bene cosi'
    switch (tono)
    {
    case "rosso":
      // variante rossa
      fotoMod.pixels[i] = color(media, 0, 0);
      break;

    case "verde":
      // variante verde
      fotoMod.pixels[i] = color(0, media, 0);
      break;

    case "blu":
      // variante blu
      fotoMod.pixels[i] = color(0, 0, media);
      break;

    case "grigio":
      fotoMod.pixels[i] = color(media, media, media);
      break;

    default:
      println("errore sulla selezione del tono !");
    } // fine switch sul tono
  }
  fotoMod.updatePixels(); // ricordarsi questo, dopo che si e' lavorato sui pixel di una PImage !

  return fotoMod;
}


// ****************************************************
// altre funzioni utili principalmente a fini didattici
// ****************************************************


void mostraMetaSup(PImage im, final int x, final int y)
{
  PImage newIm = createImage(im.width, im.height, RGB);
  im.loadPixels();
  newIm.loadPixels();
  for (int i = 0; i < (im.width*im.height)/2; i++)
  {
    newIm.pixels[i] = im.pixels[i];
  }
  newIm.updatePixels();

  image(newIm, x, y);
}

void mostraMetaInf(PImage im, final int x, final int y)
{
  PImage newIm = createImage(im.width, im.height, RGB);
  im.loadPixels();
  newIm.loadPixels();
  for (int i = im.width*im.height/2; i < im.width*im.height; i++)
  {
    newIm.pixels[i] = im.pixels[i];
  }
  newIm.updatePixels();

  image(newIm, x, y);
}
