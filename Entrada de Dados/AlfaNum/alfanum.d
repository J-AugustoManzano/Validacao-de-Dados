import std.stdio;
import std.string;
import std.uni;
import std.ascii;

bool validaHexa(string VALOR) {
  foreach (char C; VALOR) {
    dchar CARACTERE = std.ascii.toUpper(C);
    if (!(isHexDigit(CARACTERE))) {
      return false;
    }
  }
  return true;
}

void main() {
  writeln("");
  string VALOR_HEX = "";
  bool SAIR_LOOP = false;
  do {
    write("Entre valor hexadecimal de 4 caractere: ");
    VALOR_HEX = readln!string();
    VALOR_HEX = VALOR_HEX.strip(); 
    if (VALOR_HEX.length != 4) {
      writeln("Valor invalido, deve ter exatamente 4 caracteres.\n");
    }
    else if (!validaHexa(VALOR_HEX)) {
      writeln("Valor invalido, apenas caracteres [0-9] e [A-F].\n");
    }
    else {
      SAIR_LOOP = true;
    }
  } while (!SAIR_LOOP);
  string VALOR_HEX_CONVERTIDO = "";
  foreach (char C; VALOR_HEX) {
    dchar CARACTERE = std.ascii.toUpper(C);
    VALOR_HEX_CONVERTIDO ~= CARACTERE;
  }
  writeln("Valor fornecido: ", VALOR_HEX_CONVERTIDO, "\n");
}
