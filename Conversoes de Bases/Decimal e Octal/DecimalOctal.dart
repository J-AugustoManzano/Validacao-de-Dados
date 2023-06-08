import 'dart:io';
import 'dart:math';

const int LimiteMaximoDecimal = 2147483647;
const int LimiteMaximoOctal = 17777777777;

int decimalParaOctal(int decimal) {
  int resto, potencia = 1, octal = 0;
  while (decimal > 0) {
    resto = decimal % 8;
    octal += resto * potencia;
    decimal ~/= 8;
    potencia *= 10;
  }
  return octal;
}

int octalParaDecimal(int octal) {
  int potencia = 0, digito, decimal = 0;
  while (octal > 0) {
    digito = octal % 10;
    decimal += digito * pow(8, potencia).toInt();
    octal ~/= 10;
    potencia++;
  }
  return decimal;
}

bool isValidOctal(int octal) {
  while (octal > 0) {
    if (octal % 10 > 7) {
      return false;
    }
    octal ~/= 10;
  }
  return true;
}

void main() {
  int opcao;
  int decimal;
  int octal;
  do {
    print('=========================');
    print(' CONVERSOR DECIMAL-OCTAL       ');
    print('==========================');
    print('');
    print('1 - Converter decimal para octal');
    print('2 - Converter octal para decimal');
    print('0 - Sair');
    print('');
    stdout.write('Digite a opcao desejada: ');
    opcao = int.parse(stdin.readLineSync()!);
    switch (opcao) {
      case 1:
        print('');
        stdout.write('Digite um numero decimal (ate $LimiteMaximoDecimal): ');
        decimal = int.parse(stdin.readLineSync()!);
        if (decimal > LimiteMaximoDecimal) {
          print('Valor decimal fora do limite permitido.');
        } else {
          print('Valor em octal: ${decimalParaOctal(decimal)}');
        }
        break;
      case 2:
        print('');
        stdout.write('Digite um numero octal (ate $LimiteMaximoOctal): ');
        octal = int.parse(stdin.readLineSync()!);
        if (!isValidOctal(octal)) {
          print('Valor octal invalido.');
        } else if (octal > LimiteMaximoOctal) {
          print('Valor octal fora do limite permitido.');
        } else {
          print('Valor em decimal: ${octalParaDecimal(octal)}');
        }
        break;
      case 0:
        break;
      default:
        print('Opcao invalida. Digite novamente.');
    }
    print('');
  } while (opcao != 0);
}
