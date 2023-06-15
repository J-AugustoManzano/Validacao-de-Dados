#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

struct Data
{
  short dia = 0;
  short mes = 0;
  short ano = 0;
  bool ok = false;
};

bool anoBissexto(const struct Data data)
{
  if (data.ano % 400 == 0)
    return true;
  if (data.ano % 4 == 0 && data.ano % 100 != 0)
    return true;
  return false;
}

int ultimoDiaMes(const struct Data data) 
{
  if (data.mes == 2) 
    return (anoBissexto(data)) ? 29 : 28;
  if (data.mes <= 7) 
    return (data.mes % 2 != 0) ? 31 : 30;
  return (data.mes % 2 != 0) ? 30 : 31;
}

void validaData(struct Data *data)
{
  data->ok = (data->ano >=    1) &&
             (data->ano <= 9999) &&
             (data->mes >=    1) &&
             (data->mes <=   12) &&
             (data->dia >=    1) &&
             (data->dia <= ultimoDiaMes(*data)) &&
           !((data->ano == 1582) &&
             (data->mes ==   10) &&
             (data->dia >=    5) &&
             (data->dia <=   14));
}

void alteraData(short dia, short mes, short ano, struct Data *data)
{
  data->dia = dia; 
  data->mes = mes;
  data->ano = ano;
  validaData(data);
}

void mostraData(const struct Data data)
{
  if (data.ok)
  {
    printf("%02i", data.dia);
    printf("/");
    printf("%02i", data.mes);
    printf("/");
    printf("%04i\n", data.ano);
  }
  else
    printf("**/**/****\n");
}

int main(void)
{
    struct Data data;
    char DTS[11];
    short DIA, MES, ANO;

    printf("TESTE DE VALIDACAO DE DATA (CALENDARIO)\n");
    printf("=======================================\n\n");

    printf("Entre uma data no formato DD/MM/AAAA: ");
    scanf("%[^\n]", DTS);
    getchar();

    DIA = (short)atoi(&DTS[0]);
    MES = (short)atoi(&DTS[3]);
    ANO = (short)atoi(&DTS[6]);

    alteraData(DIA, MES, ANO, &data);

    printf("Data informada: ");
    mostraData(data);

    printf("\nTecle <Enter> para encerrar... ");
    getchar();

    return 0;
}
