using System;
using System.IO;

class Program
{
    static string FormataMatricula(int MATRICULA)
    {
        return MATRICULA.ToString("D6");
    }

    static int Mod10(string MATRICULA)
    {
        int SOMA = 0;
        for (int I = 0; I <= 5; I++)
        {
            int DIGITO = MATRICULA[I] - '0';
            if (I % 2 != 0 && DIGITO * 2 > 9)
                SOMA += DIGITO * 2 - 9;
            else if (I % 2 != 0 && DIGITO * 2 <= 9)
                SOMA += DIGITO * 2;
            else
                SOMA += DIGITO;
        }
        int DV = (SOMA % 10 == 0) ? 0 : 10 - SOMA % 10;
        return DV;
    }

    static void Main(string[] args)
    {
        StreamWriter ARQUIVO = new StreamWriter("numeros.txt");

        Console.WriteLine("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"");
        Console.WriteLine("Padrao: Modulo 10");
        Console.WriteLine("---------------------------------------------------------------");
        Console.WriteLine();

        if (ARQUIVO == null)
        {
            Console.Error.WriteLine("Erro ao abrir o ARQUIVO.");
            Console.WriteLine("Programa encerrado.");
            return;
        }

        Console.Write("Aguarde ARQUIVO sendo gerado... ");

        for (int I = 0; I <= 999999; I++)
        {
            string MATRICULA = FormataMatricula(I);
            int DV = Mod10(MATRICULA);
            ARQUIVO.WriteLine($"{MATRICULA.Substring(0, 3)}.{MATRICULA.Substring(3)}-{DV}");
        }

        ARQUIVO.Close();

        Console.WriteLine("\n\nSUCESSO: Arquivo gerado.\n");
    }
}
