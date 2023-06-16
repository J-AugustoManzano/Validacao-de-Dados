using System;
using System.IO;

class Program
{
    static int[][] dammTab = new int[10][] {
        new int[] {0, 3, 1, 7, 5, 9, 8, 6, 4, 2},
        new int[] {7, 0, 9, 2, 1, 5, 4, 8, 6, 3},
        new int[] {4, 2, 0, 6, 8, 7, 1, 3, 5, 9},
        new int[] {1, 7, 5, 0, 9, 8, 3, 4, 2, 6},
        new int[] {6, 1, 2, 3, 0, 4, 5, 9, 7, 8},
        new int[] {3, 6, 7, 4, 2, 0, 9, 5, 8, 1},
        new int[] {5, 8, 6, 9, 7, 2, 0, 1, 3, 4},
        new int[] {8, 9, 4, 5, 3, 6, 2, 0, 1, 7},
        new int[] {9, 4, 3, 8, 6, 1, 7, 2, 0, 5},
        new int[] {2, 5, 8, 1, 4, 3, 6, 7, 9, 0}
    };

    static int GerarDamm(string NUMERO)
    {
        int DV = 0, I;
        for (I = 0; I < NUMERO.Length; I++)
        {
            DV = dammTab[DV][int.Parse(NUMERO[I].ToString())];
        }
        return DV;
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
        Console.WriteLine("Padrao: Damm");
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
            DV = GerarDamm(MATRICULA);
            ARQUIVO.WriteLine($"{MATRICULA.Substring(0, 3)}.{MATRICULA.Substring(3)}-{DV}");
        }

        ARQUIVO.Close();

        Console.WriteLine("\n\nSUCESSO: Arquivo gerado.\n");
    }
}
