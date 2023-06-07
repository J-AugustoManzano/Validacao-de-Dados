import 'dart:io';

void main() {
  int NUMERO;
  do {
    stdout.write('Entre um número: ');
    try {
      NUMERO = int.parse(stdin.readLineSync()!);
      break;
    } catch (FormatException) {
      print('Entrada inválida. Por favor, tente novamente.');
    }
  } while (true);
  print('Você informou o número: $NUMERO');
}
