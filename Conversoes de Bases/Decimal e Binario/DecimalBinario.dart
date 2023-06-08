import 'dart:io';

const int limiteMaximoDecimal = 2147483647;
const String limiteMaximoBinario = '1111111111111111111111111111111';

String decimalParaBinario(int decimal) {
  String binario = '';
  while (decimal > 0) {
    int resto = decimal % 2;
    binario = '$resto$binario';
    decimal = decimal ~/ 2;
  }
  while (binario.length < 32) {
    binario = '0$binario';
  }
  return binario;
}

int binarioParaDecimal(String binario) {
  int valor = 0;
  for (int i = binario.length - 1; i >= 0; i--) {
    if (binario[i] == '1') {
      int potencia = binario.length - 1 - i;
      valor += 1 << potencia;
    }
  }
  return valor;
}

bool isValidBinario(String binario) {
  for (int i = 0; i < binario.length; i++) {
    if (binario[i] != '0' && binario[i] != '1') {
      return false;
    }
  }
  return true;
}

void main() {
  int opcao = 0;
  int decimal = 0;
  String binario = '';
  do {
    print('===========================');
    print(' CONVERSOR DECIMAL-BINARIO ');
    print('===========================');
    print('');
    print('1 - Converter decimal para binario');
    print('2 - Converter binario para decimal');
    print('0 - Sair');
    print('');
    stdout.write('Digite a opcao desejada: ');
    opcao = int.parse(stdin.readLineSync()!);
    switch (opcao) {
      case 1:
        print('');
        stdout.write('Digite um numero decimal (ate $limiteMaximoDecimal): ');
        decimal = int.parse(stdin.readLineSync()!);
        if (decimal > limiteMaximoDecimal) {
          print('Valor decimal fora do limite permitido.');
        } else {
          print('Valor em binario: ${decimalParaBinario(decimal)}');
        }
        break;
      case 2:
        print('');
        stdout.write('Digite um numero binario (ate $limiteMaximoBinario): ');
        binario = stdin.readLineSync()!;
        if (!isValidBinario(binario)) {
          print('Valor binario invalido.');
        } else if (binario.length > limiteMaximoBinario.length) {
          print('Valor binario fora do limite permitido.');
        } else {
          print('Valor em decimal: ${binarioParaDecimal(binario)}');
        }
        break;
      default:
        break;
    }
    print('');
  } while (opcao != 0);
}
