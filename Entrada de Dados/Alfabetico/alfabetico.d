import std.stdio;
import std.string;

void main()
{
  
  string TEXTO;
  bool VALIDACAO;
  size_t I;

  do
  {
    write("Entre uma cadeia alfabética: ");
    TEXTO = readln().strip();
    VALIDACAO = true;
    for (I = 0; I < TEXTO.length; I++)
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
      writeln("Entrada inválida. Por favor, tente novamente.");
    }
    else
    {
      break;
    }
  }
  while (true);
  writeln("Você informou a cadeia: ", TEXTO);
}
