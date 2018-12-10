color nero, rosso, verde, blu;

void setup()
{
  size (1200, 800);

  // uso queste variabili per evitare costanti 'hard-coded'
  // (ora e' anche piu' facile modificare i colori, in quanto
  // le loro definizioni sono centralizzate in un unico posto
  nero = color(0);
  rosso = color(255, 0, 0);
  verde = color(0, 255, 0);
  blu = color(0, 0, 255);
}

void draw()
{
  coloraSfondoSecondoMouse();
}

void coloraSfondoSecondoMouse()
{
  // una volta trovata una condizione vera, le altre non vengono testate, grazie ad 'else if' ;
  // usando solo 'if', invece, ogni condizione verrebbe testata e questo non avrebbe senso, in quanto
  // solo una condizione restituira' true - le altre, tutte false. Dunque, una volta trovata la condizione che restituisce true,
  // non ha senso controllare anche le altre: equivale solo a spendere tempo in computazioni inutili - ed introdurre,
  // potenzialmente, comportamenti indesiderati !
  if (mouseInAltoASinistra()) background(nero);
  else if (mouseInAltoADestra()) background(rosso); // la condizione viene controllata solo se la prima e' risultata falsa
  else if (mouseInBassoASinistra()) background(verde); // questa viene controllata solo se la prima e la seconda sono risultate false
  else background (blu); // questa viene eseguita solo se tutte le altre sono false, cioe' per esclusione !
}

// Ho creato queste funzioni per rendere il codice piu' leggibile:
// ci sono molte piu' righe rispetto alla versione gia' buona e funzionante creata da Andrea,
// ma questa e' piu' leggibile, cioe' si legge proprio come un testo in italiano !
// La leggibilita' e' molto importante, nel codice !
// Comuqune congratulazioni ad Andrea, che ha risolto il problema !!

boolean mouseInAltoASinistra()
{
  return (mouseX < width/2 & mouseY < height/2); // questo restituisce o 'true' o 'false'
}

boolean mouseInAltoADestra()
{
  return (mouseX > width/2 && mouseY < height/2); // questo restituisce o 'true' o 'false'
}

boolean mouseInBassoASinistra()
{
  return (mouseX < width/2 && mouseY > height/2); // questo restituisce o 'true' o 'false'
}
