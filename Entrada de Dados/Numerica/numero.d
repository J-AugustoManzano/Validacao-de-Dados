import std.stdio;
import std.conv;
import std.string;

int NUMERO;
string NUMERO_AUX;
bool VALIDACAO;

void main()
{
  VALIDACAO = false;
  do {
    write("Entre um numero: ");
    NUMERO_AUX = readln().strip();
    try {
      NUMERO = to!int(NUMERO_AUX);
      VALIDACAO = true;
    } 
    catch (ConvException) {
      write("Entrada invalida. Por favor, tente novamente.\n");
    }
  } while (! (VALIDACAO == true));
  writefln("Voce informou o numero: %d", NUMERO);
}
