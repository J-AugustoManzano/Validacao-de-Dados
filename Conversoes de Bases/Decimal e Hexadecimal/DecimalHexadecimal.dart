import 'dart:io';
import 'dart:math';

String DecimalParaHexadecimal(int decimal) {
  String hexadecimal = '';
  do {
    int resto = decimal % 16;
    if (resto >= 0 && resto <= 9)
      hexadecimal = String.fromCharCode(resto + '0'.codeUnitAt(0)) + hexadecimal;
    else
      hexadecimal =
          String.fromCharCode(resto - 10 + 'A'.codeUnitAt(0)) + hexadecimal;
    decimal = decimal ~/ 16;
  } while (decimal != 0);
  return hexadecimal;
}

int HexadecimalParaDecimal(String hexadecimal) {
  int potencia = 0;
  int decimal = 0;
  while (hexadecimal.isNotEmpty) {
    String digito = hexadecimal[hexadecimal.length - 1].toUpperCase();
    if (digito.compareTo('0') >= 0 && digito.compareTo('9') <= 0)
      decimal +=
          int.parse(digito) * pow(16, potencia).toInt();
    else if (digito.compareTo('A') >= 0 && digito.compareTo('F') <= 0)
      decimal += (digito.codeUnitAt(0) - 'A'.codeUnitAt(0) + 10) *
          pow(16, potencia).toInt();
    hexadecimal = hexadecimal.substring(0, hexadecimal.length - 1);
    potencia++;
  }
  return decimal;
}

bool IsValidHexadecimal(String hexadecimal) {
  RegExp regex = RegExp(r'^[0-9A-Fa-f]+$');
  return regex.hasMatch(hexadecimal);
}

void main() {
  const int LimiteMaximoDecimal = 2147483647;
  const String LimiteMaximoHexadecimal = '7FFFFFFF';
  int opcao;
  int decimal;
  String hexadecimal;
  do {
    print('===============================');
    print(' CONVERSOR DECIMAL-HEXADECIMAL ');
    print('===============================');
    print('');
    print('1 - Converter decimal para hexadecimal');
    print('2 - Converter hexadecimal para decimal');
    print('0 - Sair');
    print('');
    stdout.write('Digite a opcao desejada: ');
    opcao = int.parse(stdin.readLineSync()!);
    switch (opcao) {
      case 1:
        print('');
        stdout.write(
            'Digite um numero decimal (ate $LimiteMaximoDecimal): ');
        decimal = int.parse(stdin.readLineSync()!);
        if (decimal > LimiteMaximoDecimal)
          print('Valor decimal fora do limite permitido.');
        else
          print(
              'Valor em hexadecimal: ${DecimalParaHexadecimal(decimal)}');
        break;
      case 2:
        print('');
        stdout.write(
            'Digite um numero hexadecimal (ate $LimiteMaximoHexadecimal): ');
        hexadecimal = stdin.readLineSync()!;
        if (!IsValidHexadecimal(hexadecimal))
          print('Valor hexadecimal invalido.');
        else if (HexadecimalParaDecimal(hexadecimal) > LimiteMaximoDecimal)
          print('Valor hexadecimal fora do limite permitido.');
        else
          print('Valor em decimal: ${HexadecimalParaDecimal(hexadecimal)}');
        break;
    }
    print('');
  } while (opcao != 0);
}
