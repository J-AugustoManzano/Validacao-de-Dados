import 'dart:io';

void main() {
  String TEXTO;
  bool VALIDACAO;

  do {
    stdout.write('Entre uma cadeia alfabética: ');
    TEXTO = stdin.readLineSync()!;
    VALIDACAO = TEXTO.split('').any((CARACTERE) => RegExp(r'[a-zA-Z ]').hasMatch(CARACTERE));
    if (!VALIDACAO) {
      print('Entrada inválida. Por favor, tente novamente.');
    } else {
      break;
    }
  } while (true);
    print('Você informou a cadeia: $TEXTO');
}
