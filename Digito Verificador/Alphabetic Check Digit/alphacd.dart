import 'dart:io';

void main() {
  print('ALPHABETIC CHECK DIGIT');
  print('======================');
  print('');

  stdout.write('Entre matricula alfanumerica (tamanho livre): ');
  String? entrada = stdin.readLineSync();
  if (entrada != null) {
    print('Dígito verificador para $entrada = ${alphaCD(entrada)}');
    print('');

    stdout.write('Entre matricula e dígito verificador (juntos): ');
    String? matricula = stdin.readLineSync();
    if (matricula != null) {
      String digitoVerificador = matricula.substring(matricula.length - 1);
      String matriculaSemDigito = matricula.substring(0, matricula.length - 1).trim();

      if (alphaCD(matriculaSemDigito) == digitoVerificador) {
        print('Numero valido.');
      } else {
        print('Numero invalido.');
      }
    } else {
      print('Entrada inválida.');
    }
  } else {
    print('Entrada inválida.');
  }
}

String alphaCD(String valor) {
  int soma = 0;
  int proximo = 0;
  List<int> digitos = List<int>.filled(valor.length, 0);

  for (int i = 0; i < valor.length; i++) {
    String caractere = valor[i].toUpperCase();
    if (caractere == ' ' || caractere == '.' || caractere == '-') {

      continue;
    } else if (caractere.compareTo('0') >= 0 && caractere.compareTo('9') <= 0) {
      digitos[valor.length - i - 1] = caractere.codeUnitAt(0) - '0'.codeUnitAt(0);
    } else if (caractere.compareTo('A') >= 0 && caractere.compareTo('Z') <= 0) {
      digitos[valor.length - i - 1] = (caractere.codeUnitAt(0) - 'A'.codeUnitAt(0) + 1) % 9;
    }

    if ((i + 1) % 2 == 0) {
      digitos[valor.length - i - 1] *= 2;
      if (digitos[valor.length - i - 1] >= 10) {
        digitos[valor.length - i - 1] = (digitos[valor.length - i - 1] ~/ 10) + (digitos[valor.length - i - 1] % 10);
      }
    }

    soma += digitos[valor.length - i - 1];
  }

  if (soma % 10 == 0) {
    proximo = soma;
  } else {
    proximo = ((soma ~/ 10) + 1) * 10;
  }

  return String.fromCharCode(proximo - soma + '0'.codeUnitAt(0));
}
