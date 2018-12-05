int raggio;
boolean isRed; // questa variabile puo' valere solo true o false, in quanto e' di tipo boolean

void setup()
{
  size(300, 300);
  background(#0000ff); // parti con sfondo blu
  noStroke();
  // ***
  // e' bene inizializzare in setup tutte le variabili ad un valore di base !
  isRed = true; // partiamo con cerchio crescente rosso
  raggio = 0;
  // ***
}

void draw()
{
  // ho preferito spezzettare il codice in varie funzioni, ciascuna con un compito ben preciso
  color coloreAttuale = valutaColore(); // ho speso un po' di tempo a cercare dei *nomi buoni* per variabili e funzioni
  int raggioAttuale = aggiornaRaggio(); // *nomi buoni* sono auto-esplicativi e possibilmente brevi
  cerchio(coloreAttuale, raggioAttuale);
}

// questa function si occupa solo di aggiornare il valore del raggio
// anche se ha una sola riga di codice effettivo (in realta' ne ha 2, ma solo una fa un vero calcolo),
// e' bene separare il codice in functions
int aggiornaRaggio()
{
  final int vel = 4;  // a nessuno serve questa variabile, oltre a questo ambiente: l'ho spostata qui, dunque !
                      // (segretezza militare!)
  raggio = raggio + vel;
  return raggio;
}

// questa function valuta solo il colore da usare: solo se un cerchio e' terminato, e' ora di cambiare colore
color valutaColore()
{
  // nota: ( !false ) e' true; ( !true ) e' false : il "!" davanti ad un boolean vuol dire "negato", cioe' l'opposto
  if (ilCerchioECompleto()) isRed = !isRed; // se completo, isRed passa da falso a vero o viceversa
  if (isRed) return color(#ff0000); // se isRed e' vero, restituisci il rosso
  else return color(#0000ff); // altrimenti, restituisci il blu
} //<>//

// questa function controlla se il cerchio attualmente in espansione e' stato completato:
// se si', restituisce true, altrimenti false . Il suo compito si limita a questo !
// sembre una operazione troppo semplice, ma le function servono a questo: sono unita' logiche
// indipendenti : fanno una cosa, bene e poi passano la palla all'ambiente che le ha chiamate
boolean ilCerchioECompleto()
{
  // ho trovato maxRaggio con il teorema di Pitagora !
  final int maxRaggio = (int)(width*sqrt(2)) + 1; // a nessuno serve questa variabile, oltre a questo ambiente: l'ho spostata qui, dunque !
                             // (segretezza militare!)
  if (raggio >= maxRaggio)
  {
    raggio = 0; // re-setta il valore del raggio a 0
    return true; // e' ora di cambiare colore ( v. function valutaColore() )
  } else return false;
}

// questa function si occupa SOLO di disegnare il cerchio attuale, con il colore attuale ed il raggio attuale, appunto !
void cerchio(color coloreAttuale, int raggioAttuale)
{
  fill(coloreAttuale);
  translate(width/2, height/2); // disegna al centro del cerchio, va detto ogni volta, nel codice chiamata dal draw
  ellipse (0, 0, raggioAttuale, raggioAttuale); // disegna in 0,0 perche' ho usato il translate
} //<>//
