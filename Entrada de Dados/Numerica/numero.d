import std.stdio;
import std.conv;
import std.string;

int NUMERO;
string NUMERO_AUX;

void main()
{
  do {
    write("Entre um numero: ");
    NUMERO_AUX = readln().strip();
    try {
      NUMERO = to!int(NUMERO_AUX);
      break;
    } 
    catch (ConvException) {
      write("Entrada invalida. Por favor, tente novamente.\n");
    }
  } while (true);
  writefln("Voce informou o numero: %d", NUMERO);
}
