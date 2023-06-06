import 'dart:io';

void main() {
  
  String TEXTO;
  int I;
  bool VALIDACAO;

  do {
    stdout.write('Entre uma cadeia alfabética: ');
    TEXTO = stdin.readLineSync()!;
    VALIDACAO = true;
    for (I = 0; I < TEXTO.length; I++) {
      String CARACTERE = TEXTO[I];
      if (!((CARACTERE.compareTo('A') >= 0 && CARACTERE.compareTo('Z') <= 0) ||
            (CARACTERE.compareTo('a') >= 0 && CARACTERE.compareTo('z') <= 0) ||
             CARACTERE == ' ')) {
        VALIDACAO = false;
        break;
      }
    }
    if (VALIDACAO == false) {
      print('Entrada inválida. Por favor, tente novamente.');
    } else {
      break;
    }
  } while (true);
  print('Você informou a cadeia: $TEXTO');
}
