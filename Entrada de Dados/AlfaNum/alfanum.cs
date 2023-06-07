using System;

class Program
{
  static bool VALIDA_HEXA(string VALOR)
  {
    foreach (char c in VALOR)
    {
      char CARACTERE = char.ToUpper(c);
      if (!(char.IsDigit(CARACTERE) || (CARACTERE >= 'A' && CARACTERE <= 'F')))
        return false;
    }
    return true;
  }

  static void Main(string[] args)
  {
    Console.WriteLine();
    string VALOR_HEX = "";
    bool SAIR_LOOP = false;
    do
    {
      Console.Write("Entre valor hexadecimal de 4 caracteres: ");
      VALOR_HEX = Console.ReadLine();
      if (VALOR_HEX.Length != 4)
      {
        Console.WriteLine("Valor invalido, deve ter exatamente 4 caracteres.\n");
      }
      else if (!VALIDA_HEXA(VALOR_HEX))
      {
        Console.WriteLine("Valor invalido, apenas caracteres [0-9] e [A-F].\n");
      }
      else
      {
        SAIR_LOOP = true;
      }
    } while (!SAIR_LOOP);
    VALOR_HEX = VALOR_HEX.ToUpper();
    Console.WriteLine("Valor fornecido: " + VALOR_HEX + "\n");
  }
}
