class Villaggio
{
  Persona[] abitanti; // il villaggio (istanza) avra' un tot di abitanti
  
  Villaggio(Persona p1, Persona p2)
  {
    abitanti = new Persona[2];
    abitanti[0] = p1;
    abitanti[1] = p2;
  }
  
  void appelloAbitanti()
  {
    for (int i = 0; i < this.abitanti.length; i++)
    {
      this.abitanti[i].saluta();
    }
  }
}
