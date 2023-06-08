import 'dart:io';

String formataValor(String valor) {
  String inteiro, decimal;
  int i;
  // Verifica se o valor possui parte decimal
  if (valor.contains('.')) {
    inteiro = valor.substring(0, valor.indexOf('.'));
    decimal = valor.substring(valor.indexOf('.') + 1);
  } else {
    inteiro = valor;
    decimal = '00';
  }
  // Formata a parte inteira
  String parteInteiraFormatada = '';
  int count = 0;
  for (i = inteiro.length - 1; i >= 0; i--) {
    parteInteiraFormatada += inteiro[i];
    count++;
    if (count % 3 == 0 && i > 0) {
      parteInteiraFormatada += '.';
    }
  }
  // Inverte a parte inteira formatada
  parteInteiraFormatada = parteInteiraFormatada.split('').reversed.join();
  // Concatena a parte decimal
  String valorFormatadoCompleto = '$parteInteiraFormatada,$decimal';
  return valorFormatadoCompleto;
}

void main() {
  stdout.write('Digite um valor real: ');
  String valor = stdin.readLineSync()!;
  String valorFormatado = formataValor(valor);
  print('Valor formatado: $valorFormatado');
}

