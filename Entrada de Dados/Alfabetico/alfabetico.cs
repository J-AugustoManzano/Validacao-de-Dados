using System;
using System.Linq;

class Program
{
  static void Main()
  {
    string TEXTO;
    bool VALIDACAO;

    do
    {
      Console.Write("Entre uma cadeia alfabetica: ");
      TEXTO = Console.ReadLine();
      VALIDACAO = TEXTO.Any(CARACTERE => (CARACTERE >= 'A' && CARACTERE <= 'Z') || 
                                         (CARACTERE >= 'a' && CARACTERE <= 'z') || 
                                          CARACTERE == ' ');
      if (!VALIDACAO)
      {
        Console.WriteLine("Entrada invalida. Por favor, tente novamente.");
      }
      else
      {
        break;
      }
    }
    while (true);

    Console.WriteLine("Voce informou a cadeia: " + TEXTO);
  }
}
