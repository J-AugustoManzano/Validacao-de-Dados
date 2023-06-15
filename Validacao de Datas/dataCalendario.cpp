 #include <iostream>
#include <string>
using namespace std;

struct Data
{
    short dia;
    short mes;
    short ano;
    bool  ok;
};

int StrToInt(const string& cadeia)
{
    int valor = 0;
    int sinal = 1;
    if (cadeia.empty())
        return 0;
    if (cadeia[0] == '-')
    {
        sinal = -1;
        for (size_t i = 1; i < cadeia.length(); i++)
        {
            if (not isdigit(cadeia[i]))
                return 0;
            valor = valor * 10 + cadeia[i] - '0';
        }
    }
    else
    {
        for (size_t i = 0; i < cadeia.length(); i++)
        {
            if (not isdigit(cadeia[i]))
                return 0;
            valor = valor * 10 + cadeia[i] - '0';
        }
    }
    return valor * sinal;
}

string IntToStr(int valor)
{
    return to_string(valor);
}

string Formatar(int valor, int digitos)
{
    string valorCadeia = IntToStr(valor);
    while (valorCadeia.length() < static_cast<size_t>(digitos))
        valorCadeia = '0' + valorCadeia;
    return valorCadeia;
}

bool anoBissexto(const Data& data)
{
    if (data.ano % 400 == 0)
        return true;
    else if ((data.ano % 4 == 0) and (data.ano % 100 != 0))
        return true;
    else
        return false;
}

int ultimoDiaMes(const Data& data)
{
  if (data.mes == 2) 
    return (anoBissexto(data)) ? 29 : 28;
  if (data.mes <= 7) 
    return (data.mes % 2 != 0) ? 31 : 30;
  return (data.mes % 2 != 0) ? 30 : 31;
}

void validaData(Data& data)
{
    data.ok = (data.ano >=    1) and 
              (data.ano <= 9999) and
              (data.mes >=    1) and 
              (data.mes <=   12) and
              (data.dia >=    1) and 
              (data.dia <= ultimoDiaMes(data)) and
         not ((data.ano == 1582) and
              (data.mes ==   10) and
              (data.dia >=    5) and
              (data.dia <=   14));
}

void alteraData(Data& data, int dia, int mes, int ano)
{
    data.dia = dia;
    data.mes = mes;
    data.ano = ano;
    validaData(data);
}

void mostraData(const Data& data)
{
    if (data.ok)
        cout << Formatar(data.dia, 2) << '/' << Formatar(data.mes, 2) << '/' << Formatar(data.ano, 4) << endl;
    else
        cout << "**/**/****" << endl;
}

int main(void)
{
    cout << "TESTE DE VALIDACAO DE DATA (CALENDARIO)" << endl;
    cout << "=======================================" << endl << endl;
    cout << "Entre data no formato DD/MM/AAAA: ";
    
    string DTS;
    getline(cin, DTS);

    int DIA = StrToInt(DTS.substr(0, 2));
    int MES = StrToInt(DTS.substr(3, 2));
    int ANO = StrToInt(DTS.substr(6, 4));

    Data data;
    alteraData(data, DIA, MES, ANO);

    cout << "Data informada: ";
    mostraData(data);

    cout << endl << "Tecle <Enter> para encerrar... ";
    cin.ignore();

    return 0;
}
