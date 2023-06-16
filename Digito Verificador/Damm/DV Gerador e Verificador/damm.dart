import 'dart:io';

final List<List<int>> dammTab = [
  [0, 3, 1, 7, 5, 9, 8, 6, 4, 2],
  [7, 0, 9, 2, 1, 5, 4, 8, 6, 3],
  [4, 2, 0, 6, 8, 7, 1, 3, 5, 9],
  [1, 7, 5, 0, 9, 8, 3, 4, 2, 6],
  [6, 1, 2, 3, 0, 4, 5, 9, 7, 8],
  [3, 6, 7, 4, 2, 0, 9, 5, 8, 1],
  [5, 8, 6, 9, 7, 2, 0, 1, 3, 4],
  [8, 9, 4, 5, 3, 6, 2, 0, 1, 7],
  [9, 4, 3, 8, 6, 1, 7, 2, 0, 5],
  [2, 5, 8, 1, 4, 3, 6, 7, 9, 0]
];

int gerarDamm(String NUMERO) {
  int DV = 0;
  for (int I = 0; I < NUMERO.length; I++) {
    DV = dammTab[DV][int.parse(NUMERO[I])];
  }
  return DV;
}

bool validarDamm(String NUMERO) {
  int DV = 0;
  for (int I = 0; I < NUMERO.length; I++) {
    DV = dammTab[DV][int.parse(NUMERO[I])];
  }
  return DV == 0;
}

String removerMascara(String NUMERO) {
  String NUMERO_SMASC = '';
  bool encontrouPrimeiroDigito = false;

  for (int I = 0; I < NUMERO.length; I++) {
    String caractere = NUMERO[I];
    if (caractere == '.') {
      encontrouPrimeiroDigito = true;
    } else if (RegExp(r'[0-9]').hasMatch(caractere)) {
      if (!encontrouPrimeiroDigito && caractere == '0') {
        continue;
      }
      NUMERO_SMASC += caractere;
    }
  }

  return NUMERO_SMASC;
}

void main() {
  bool entradaValida = false;
  String NUMERO, NUMERO_COM_DV, NUMERO_SEM_MASCARA_DV, NUMERO_SMASC;
  int DV;

  do {
    stdout.write('Entre matricula no formato 999.999: ');
    NUMERO = stdin.readLineSync()!;
    stdout.writeln();
    if (NUMERO.length != 7 || NUMERO[3] != '.') {
      stdout.writeln();
      stdout.writeln('Matricula invalida. Tente novamente.');
      stdout.writeln();
    } else {
      entradaValida = true;
    }
  } while (!entradaValida);

  NUMERO_SMASC = removerMascara(NUMERO);
  DV = gerarDamm(NUMERO_SMASC);
  stdout.writeln('Digito verificador: $DV');
  stdout.writeln();

  entradaValida = false;
  do {
    stdout.write('Entre matricula e digito verificador no formato 999.999-9: ');
    NUMERO_COM_DV = stdin.readLineSync()!;
    stdout.writeln();
    if (NUMERO_COM_DV.length != 9 ||
        NUMERO_COM_DV[3] != '.' ||
        NUMERO_COM_DV[7] != '-') {
      stdout.writeln();
      stdout.writeln('Matricula invalida. Tente novamente.');
      stdout.writeln();
    } else {
      entradaValida = true;
    }
  } while (!entradaValida);

  NUMERO_SEM_MASCARA_DV = removerMascara(NUMERO_COM_DV);
  if (validarDamm(NUMERO_SEM_MASCARA_DV)) {
    stdout.writeln('Matricula valida.');
  } else {
    stdout.writeln('Matricula invalida.');
  }
}
