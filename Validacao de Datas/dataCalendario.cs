using System;

struct Data
{
    public short dia;
    public short mes;
    public short ano;
    public bool ok;
}

class Program
{
    Data exemplo = new Data { dia = 0, mes = 0, ano = 0, ok = false };
    
    static int StrToInt(string cadeia)
    {
        int valor = 0;
        int sinal = 1;
        if (string.IsNullOrEmpty(cadeia))
            return 0;
        if (cadeia[0] == '-')
        {
            sinal = -1;
            for (int i = 1; i < cadeia.Length; i++)
            {
                if (!char.IsDigit(cadeia[i]))
                    return 0;
                valor = valor * 10 + cadeia[i] - '0';
            }
        }
        else
        {
            for (int i = 0; i < cadeia.Length; i++)
            {
                if (!char.IsDigit(cadeia[i]))
                    return 0;
                valor = valor * 10 + cadeia[i] - '0';
            }
        }
        return valor * sinal;
    }

    static string IntToStr(int valor)
    {
        return valor.ToString();
    }

    static string Formatar(int valor, int digitos)
    {
        string valorCadeia = IntToStr(valor);
        while (valorCadeia.Length < digitos)
            valorCadeia = '0' + valorCadeia;
        return valorCadeia;
    }

    static bool anoBissexto(Data data)
    {
        if (data.ano % 400 == 0)
            return true;
        else if ((data.ano % 4 == 0) && (data.ano % 100 != 0))
            return true;
        else
            return false;
    }

    static int ultimoDiaMes(Data data)
    {
        if (data.mes == 2)
            return (anoBissexto(data)) ? 29 : 28;
        if (data.mes <= 7)
            return (data.mes % 2 != 0) ? 31 : 30;
        return (data.mes % 2 != 0) ? 30 : 31;
    }

    static void validaData(ref Data data)
    {
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

    static void alteraData(ref Data data, int dia, int mes, int ano)
    {
        data.dia = (short)dia;
        data.mes = (short)mes;
        data.ano = (short)ano;
        validaData(ref data);
    }

    static void mostraData(Data data)
    {
        if (data.ok)
            Console.WriteLine($"{Formatar(data.dia, 2)}/{Formatar(data.mes, 2)}/{Formatar(data.ano, 4)}");
        else
            Console.WriteLine("**/**/****");
    }

    static void Main(string[] args)
    {
        Console.WriteLine("TESTE DE VALIDACAO DE DATA (CALENDARIO)");
        Console.WriteLine("=======================================");
        Console.WriteLine();

        Console.Write("Entre data no formato DD/MM/AAAA: ");
        string DTS = Console.ReadLine();

        int DIA = StrToInt(DTS.Substring(0, 2));
        int MES = StrToInt(DTS.Substring(3, 2));
        int ANO = StrToInt(DTS.Substring(6, 4));

        Data data = new Data();
        alteraData(ref data, DIA, MES, ANO);

        Console.Write("Data informada: ");
        mostraData(data);

        Console.WriteLine();
        Console.Write("Tecle <Enter> para encerrar... ");
        Console.ReadLine();
    }
}
