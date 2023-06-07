import 'dart:io';

void main() {
  stdout.write('Digite um texto .....: ');
  String? texto = stdin.readLineSync();

  String textoMaiusculo = texto!.toUpperCase();
  String textoMinusculo = texto.toLowerCase();

  stdout.write('Texto em maiusculo ..: ');
  print(textoMaiusculo);

  stdout.write('Texto em minusculo ..: ');
  print(textoMinusculo);
}
