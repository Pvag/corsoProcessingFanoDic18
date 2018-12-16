class Persona
{
  // variabili di istanza
  int eta;
  String nome;
  float altezzaInMetri;
  
  // costruttore (Constructor)
  Persona(int e, String n, float a)
  {
    this.eta = e;
    this.nome = n;
    this.altezzaInMetri = a;
  }
  
  // ---- metodi ----
  
  void saluta()
  {
    println("Oila' mi chiamo: " + this.nome);
  }
  
  boolean maggiorenne()
  {
    if (this.eta < 18) return false;
    else return true;
  }
  
  void compiAnni()
  {
    this.eta++;
  }
  
  void dimmiEta()
  {
    println("ho " + this.eta + " anni.");
  }
}
