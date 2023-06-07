import std.stdio;
import std.string;
import std.algorithm;

void main()
{
  string TEXTO;
  bool VALIDACAO;

  do
  {
    write("Entre uma cadeia alfabetica: ");
    TEXTO = readln().strip();
    VALIDACAO = TEXTO.any!(c => (c >= 'A' && c <= 'Z') || 
                                (c >= 'a' && c <= 'z') || 
                                 c == ' ');
    if (VALIDACAO == false)
    {
      writeln("Entrada invalida. Por favor, tente novamente.");
    }
    else
    {
      break;
    }
  }
  while (true);
  
  writeln("Voce informou a cadeia: ", TEXTO);
}
