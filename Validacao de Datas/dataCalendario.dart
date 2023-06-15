import 'dart:io';

class Data {
  late int dia;
  late int mes;
  late int ano;
  late bool ok;
  Data({this.dia = 0, this.mes = 0, this.ano = 0, this.ok = false});
}

int StrToInt(String cadeia) {
  int valor = 0;
  int sinal = 1;
  if (cadeia.isEmpty) return 0;
  if (cadeia[0] == '-') {
    sinal = -1;
    for (int i = 1; i < cadeia.length; i++) {
      if (!_isDigit(cadeia[i])) return 0;
      valor = valor * 10 + int.parse(cadeia[i]);
    }
  } else {
    for (int i = 0; i < cadeia.length; i++) {
      if (!_isDigit(cadeia[i])) return 0;
      valor = valor * 10 + int.parse(cadeia[i]);
    }
  }
  return valor * sinal;
}

bool _isDigit(String character) {
  return character.codeUnitAt(0) >= '0'.codeUnitAt(0) &&
      character.codeUnitAt(0) <= '9'.codeUnitAt(0);
}

String IntToStr(int valor) {
  return valor.toString();
}

String Formatar(int valor, int digitos) {
  String valorCadeia = IntToStr(valor);
  while (valorCadeia.length < digitos) valorCadeia = '0' + valorCadeia;
  return valorCadeia;
}

bool anoBissexto(Data data) {
  if (data.ano % 400 == 0)
    return true;
  else if ((data.ano % 4 == 0) && (data.ano % 100 != 0))
    return true;
  else
    return false;
}

int ultimoDiaMes(Data data) {
  if (data.mes == 2)
    return (anoBissexto(data)) ? 29 : 28;
  if (data.mes <= 7)
    return (data.mes % 2 != 0) ? 31 : 30;
  return (data.mes % 2 != 0) ? 30 : 31;
}

void validaData(Data data) {
  data.ok = (data.ano >=    1) &&
            (data.ano <= 9999) &&
            (data.mes >=    1) &&
            (data.mes <=   12) &&
            (data.dia >=    1) &&
            (data.dia <= ultimoDiaMes(data)) &&
          !((data.ano == 1582) &&
            (data.mes ==   10) &&
            (data.dia >=    5) &&
            (data.dia <=   14));
}

void alteraData(Data data, int dia, int mes, int ano) {
  data.dia = dia;
  data.mes = mes;
  data.ano = ano;
  validaData(data);
}

void mostraData(Data data) {
  if (data.ok)
    print('${Formatar(data.dia, 2)}/${Formatar(data.mes, 2)}/${Formatar(data.ano, 4)}');
  else
    print('**/**/****');
}

void main() {
  print('TESTE DE VALIDACAO DE DATA (CALENDARIO)');
  print('=======================================');
  print('');

  stdout.write('Entre data no formato DD/MM/AAAA: ');
  String? DTS = stdin.readLineSync();

  int DIA = StrToInt(DTS!.substring(0, 2));
  int MES = StrToInt(DTS.substring(3, 5));
  int ANO = StrToInt(DTS.substring(6, 10));

  Data data = Data();
  alteraData(data, DIA, MES, ANO);

  stdout.write('Data informada: ');
  mostraData(data);

  print('');
  stdout.write('Tecle <Enter> para encerrar... ');
  stdin.readLineSync();
}
