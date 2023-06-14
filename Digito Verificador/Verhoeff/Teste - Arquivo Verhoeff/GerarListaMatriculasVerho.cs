using System;
using System.IO;

class Program
{
    static int[,] verhoeffD = new int[10, 10]
    {
        {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
        {1, 2, 3, 4, 0, 6, 7, 8, 9, 5},
        {2, 3, 4, 0, 1, 7, 8, 9, 5, 6},
        {3, 4, 0, 1, 2, 8, 9, 5, 6, 7},
        {4, 0, 1, 2, 3, 9, 5, 6, 7, 8},
        {5, 9, 8, 7, 6, 0, 4, 3, 2, 1},
        {6, 5, 9, 8, 7, 1, 0, 4, 3, 2},
        {7, 6, 5, 9, 8, 2, 1, 0, 4, 3},
        {8, 7, 6, 5, 9, 3, 2, 1, 0, 4},
        {9, 8, 7, 6, 5, 4, 3, 2, 1, 0}
    };

    static int[,] verhoeffP = new int[8, 10]
    {
        {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
        {1, 5, 7, 6, 2, 8, 3, 0, 9, 4},
        {5, 8, 0, 3, 7, 9, 6, 1, 4, 2},
        {8, 9, 1, 6, 0, 4, 3, 5, 2, 7},
        {9, 4, 5, 3, 1, 2, 6, 8, 7, 0},
        {4, 2, 8, 6, 5, 7, 3, 9, 0, 1},
        {2, 7, 9, 3, 8, 0, 6, 4, 1, 5},
        {7, 0, 4, 6, 9, 1, 3, 2, 5, 8}
    };

    static int[] verhoeffInv = { 0, 4, 3, 2, 1, 5, 6, 7, 8, 9 };

    public static int GerarVerhoeff(string NUMERO)
    {
        int DIGITO = 0, POS, NUM;
        int TAMANHO = NUMERO.Length;
        for (int I = 0; I < TAMANHO; I++)
        {
            POS = (I + 1) % 8;
            NUM = NUMERO[TAMANHO - I - 1] - 48; // ASCII 48 = '0'
            DIGITO = verhoeffD[DIGITO, verhoeffP[POS, NUM]];
        }
        return verhoeffInv[DIGITO];
    }

    static string FormataMatricula(int MATRICULA)
    {
        return MATRICULA.ToString("D6");
    }

    static void Main(string[] args)
    {
        StreamWriter ARQUIVO = new StreamWriter("numeros.txt");
        int I, DV;

        Console.WriteLine("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"");
        Console.WriteLine("Padrao: Verhoeff");
        Console.WriteLine("---------------------------------------------------------------");
        Console.WriteLine();

        if (ARQUIVO == null)
        {
            Console.Error.WriteLine("Erro ao abrir o ARQUIVO.");
            Console.WriteLine("Programa encerrado.");
            return;
        }

        Console.Write("Aguarde ARQUIVO sendo gerado... ");

        for (I = 0; I <= 999999; I++)
        {
            string MATRICULA = FormataMatricula(I);
            DV = GerarVerhoeff(MATRICULA);
            ARQUIVO.WriteLine($"{MATRICULA.Substring(0, 3)}.{MATRICULA.Substring(3)}-{DV}");
        }

        ARQUIVO.Close();

        Console.WriteLine("\n\nSUCESSO: Arquivo gerado.\n");
    }
}
