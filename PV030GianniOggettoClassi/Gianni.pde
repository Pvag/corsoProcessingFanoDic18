class Persona
{
  // Interessantissime le due righe qui sotto ! Questo e' il motivo principale di questo esempio:
  // il fatto che l'oggetto abbia dentro di se i suoi dati !
  // Non sono piu' io a dover "passare gli zaini" alle funzioni; semplicemente,
  // ora dico agli oggetti cosa fare e loro lo fanno, direttamente sui loro stessi dati !
  private int eta;
  private String nome;
  
  Persona(String nome, int eta)
  {
    this.eta = eta;
    this.nome = nome;
  }
  
  void saluta()
  {
    println(" - Buonasera, mi chiamo " + this.nome + " ed ho " + this.eta + " anni.");
  }
  
  void disegnaUnCerchioAlCentroDelCanvas()
  {
    translate(width/2, height/2);
    ellipse(0, 0, 120, 120);
    println(" - Ho disegnato un cerchio! Sempre io, " + this.nome + ".");
  }
}
