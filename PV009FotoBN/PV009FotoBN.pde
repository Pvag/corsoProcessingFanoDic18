String nomeFileFoto = "case.jpg";

void setup()
{
  size(1000, 500);
  noLoop();
}

void draw()
{
  PImage immOrig = loadImage(nomeFileFoto);
  image(immOrig, 0, 0); // mostra l'immagine originale in alto a sinistra

  PImage immMod;
  
  immMod = alteraColori(nomeFileFoto, "rosso"); // l'immagine con variante rossa a destra
  image(immMod, width/2, 0);
  
  immMod = alteraColori(nomeFileFoto, "blu"); // l'immagine con variante blu in basso a sx
  image(immMod, 0, height/2);

  immMod = alteraColori(nomeFileFoto, "grigio"); // l'immagine con variante bianco/nero in basso a dx
  image(immMod, width/2, height/2);

  immMod = alteraColori(nomeFileFoto, "verde"); // l'immagine con variante verde sopra le altre, rimpicciolita
  immMod.resize(300,180);
  image(immMod, width/2-immMod.width/2, height/2-immMod.height/2);
}

/** Restituisce una immagine con i colori modificati in favore della componente specificata
 *  nella variabile tono, a partire dal nome del file dell'immagine originale.
 *  Ricorda: metti il file con l'immagine originale nella cartella di questo sketch.
 *
 * @param fileName il nome del file originale dal quale calcolare le modifiche colore
 * @param tono il tono verso cui virare i colori dell'immagine
 * @return una nuova immagine, con colori corrispondenti al tono scelto
 */
PImage alteraColori(String fileName, String tono)
{
  PImage foto = loadImage(fileName);
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
        foto.pixels[i] = color(media, 0, 0);
        break;
        
      case "verde":
        // variante verde
        foto.pixels[i] = color(0, media, 0);
        break;
        
      case "blu":
        // variante blu
        foto.pixels[i] = color(0, 0, media);
        break;
        
      case "grigio":
        foto.pixels[i] = color(media, media, media);
        break;
        
      default:
        println("errore sulla selezione del tono !");
    } // fine switch sul tono
  }
  foto.updatePixels(); // ricordarsi questo, dopo che si e' lavorato sui pixel di una PImage !
  
  return foto;
}
