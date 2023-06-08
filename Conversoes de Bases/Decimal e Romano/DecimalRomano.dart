import 'dart:io';

const List<String> AlgarismosRomanos = ['I', 'IV', 'V', 'IX', 'X', 'XL', 'L', 'XC', 'C', 'CD', 'D', 'CM', 'M'];
const List<int> ValoresDecimais = [1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000];
const int LimiteMaximoDecimal = 3999;
const String LimiteMaximoRomano = 'MMMCMXCIX';

String decimalParaRomano(int decimal) {
  String romano = '';
  int i = 12;
  while (decimal > 0) {
    if (decimal >= ValoresDecimais[i]) {
      romano += AlgarismosRomanos[i];
      decimal -= ValoresDecimais[i];
    } else {
      i -= 1;
    }
  }
  return romano;
}

int romanoParaDecimal(String romano) {
  int resultado = 0;
  int valorAnterior = 0;
  romano = romano.toUpperCase();
  for (int i = romano.length - 1; i >= 0; i--) {
    bool valorEncontrado = false;
    for (int valorAtual = 0; valorAtual < 13; valorAtual++) {
      if (romano[i] == AlgarismosRomanos[valorAtual]) {
        valorEncontrado = true;
        if (valorAtual < valorAnterior) {
          resultado -= ValoresDecimais[valorAtual];
        } else {
          resultado += ValoresDecimais[valorAtual];
          valorAnterior = valorAtual;
        }
        break;
      }
    }
    if (!valorEncontrado) {
      resultado = 0;
      break;
    }
  }
  return resultado;
}

void main() {
  int opcao;
  int decimal;
  String romano;
  do {
    print('==========================');
    print(' CONVERSOR DECIMAL-ROMANO ');
    print('==========================');
    print('');
    print('1 - Converter decimal para romano');
    print('2 - Converter romano para decimal');
    print('0 - Sair');
    print('');
    stdout.write('Digite a opcao desejada: ');
    opcao = int.parse(stdin.readLineSync()!);
    switch (opcao) {
      case 1:
        print('');
        stdout.write('Digite um numero decimal (ate $LimiteMaximoDecimal): ');
        decimal = int.parse(stdin.readLineSync()!);
        if (decimal < 1 || decimal > LimiteMaximoDecimal) {
          print('Valor decimal fora do limite permitido.');
        } else {
          print('Valor em algarismo romano: ${decimalParaRomano(decimal)}');
        }
        break;
      case 2:
        print('');
        stdout.write('Digite um numero romano (ate $LimiteMaximoRomano): ');
        romano = stdin.readLineSync()!;
        romano = romano.toUpperCase();
        if (romano.isEmpty || romanoParaDecimal(romano) == 0) {
          print('Valor romano fora do limite permitido.');
        } else {
          print('Valor em decimal: ${romanoParaDecimal(romano)}');
        }
        break;
    }
    print('');
  } while (opcao != 0);
}
