using System;

class Program
{
  static void Main()
  {
	  
    string TEXTO;
    bool VALIDACAO;

    do
    {
      Console.Write("Entre uma cadeia alfabética: ");
      TEXTO = Console.ReadLine();
      VALIDACAO = true;
      for (int I = 0; I < TEXTO.Length; I++)
      {
        char CARACTERE = TEXTO[I];
        if (!((CARACTERE >= 'A' && CARACTERE <= 'Z') ||
              (CARACTERE >= 'a' && CARACTERE <= 'z') ||
               CARACTERE == ' '))
        {
          VALIDACAO = false;
          break;
        }
      }
      if (VALIDACAO == false)
      {
        Console.WriteLine("Entrada inválida. Por favor, tente novamente.");
      }
      else
      {
        break;
      }
    }
    while (true);
    Console.WriteLine("Você informou a cadeia: " + TEXTO);
  }
}
