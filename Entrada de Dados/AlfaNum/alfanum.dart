import 'dart:io';

bool VALIDA_HEXA(String VALOR) {
  for (var c in VALOR.runes) {
    var CARACTERE = String.fromCharCode(c).toUpperCase();
    if (!(RegExp(r'[0-9A-F]').hasMatch(CARACTERE))) {
      return false;
    }
  }
  return true;
}

void main() {
  var SCANNER = stdin;
  print('');
  var VALOR_HEX = '';
  var SAIR_LOOP = false;
  do {
    stdout.write('Entre valor hexadecimal de 4 caracteres: ');
    VALOR_HEX = SCANNER.readLineSync()!;
    if (VALOR_HEX.length != 4) {
      print('Valor invalido, deve ter exatamente 4 caracteres.\n');
    } else if (!VALIDA_HEXA(VALOR_HEX)) {
      print('Valor invalido, apeanas caracteres [0-9] e [A-F].\n');
    } else {
      SAIR_LOOP = true;
    }
  } while (!SAIR_LOOP);
  VALOR_HEX = VALOR_HEX.toUpperCase();
  print('Valor fornecido: $VALOR_HEX\n');
}
