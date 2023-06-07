using System;

class Program
{
  static void Main()
  {
    
    int NUMERO;
    
    do
    {
      Console.Write("Entre um numero: ");
      string NUMERO_AUX = Console.ReadLine();
      if (int.TryParse(NUMERO_AUX, out NUMERO))
      {
        break;
      }
      else
      {
        Console.WriteLine("Entrada invalida. Por favor, tente novamente.");
      }
    } while (true);
    Console.WriteLine("Voce informou o numero: " + NUMERO);
  }
}
