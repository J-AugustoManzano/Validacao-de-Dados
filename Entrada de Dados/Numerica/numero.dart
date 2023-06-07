import 'dart:io';

void main() {

  int NUMERO;
  String NUMERO_AUX;
  
  do {
    stdout.write('Entre um numero: ');
    NUMERO_AUX = stdin.readLineSync()!;
    try {
      NUMERO = int.parse(NUMERO_AUX);
      break;
    } catch (FormatException) {
      print('Entrada invalida. Por favor, tente novamente.');
    }
  } while (true);
  print('Voce informou o número: $NUMERO');
}
