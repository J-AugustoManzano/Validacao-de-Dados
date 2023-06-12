using System;
using System.IO;

class Program
{
    static string FormataMatricula(int matricula)
    {
        return matricula.ToString("D6");
    }

    static int Mod10(string matricula)
    {
        int soma = 0;
        for (int i = 0; i < 6; i++)
        {
            int digito = matricula[i] - '0';
            if (i % 2 != 0 && digito * 2 > 9)
                soma += digito * 2 - 9;
            else if (i % 2 != 0 && digito * 2 <= 9)
                soma += digito * 2;
            else
                soma += digito;
        }
        int dv = (soma % 10 == 0) ? 0 : 10 - soma % 10;
        return dv;
    }

    static void Main(string[] args)
    {
        StreamWriter arquivo = new StreamWriter("numeros.txt");

        Console.WriteLine("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"");
        Console.WriteLine("Padrao: Modulo 10");
        Console.WriteLine("---------------------------------------------------------------");
        Console.WriteLine();

        if (arquivo == null)
        {
            Console.Error.WriteLine("Erro ao abrir o arquivo.");
            Console.WriteLine("Programa encerrado.");
            return;
        }

        Console.Write("Aguarde arquivo sendo gerado... ");

        for (int i = 0; i <= 999999; i++)
        {
            string matricula = FormataMatricula(i);
            int dv = Mod10(matricula);
            arquivo.WriteLine($"{matricula.Substring(0, 3)}.{matricula.Substring(3)}-{dv}");
        }

        arquivo.Close();

        Console.WriteLine("\n\nSUCESSO: Arquivo gerado.\n");
    }
}
