using System;
using System.IO;

class Program
{
    static void RemoverCaractere(char[] CADEIA, char CARACTERE)
    {
        int POS1 = 0;
        int POS2 = 0;
        while (CADEIA[POS1] != 0)
        {
            CADEIA[POS2] = CADEIA[POS1];
            POS2 += (CADEIA[POS2] != CARACTERE) ? 1 : 0;
            POS1 += 1;
        }
        CADEIA[POS2] = (char)0;
    }

    static char Mod11(char[] MATRIC_CPT)
    {
        char[] MATRIC_SPT = new char[8];
        int[] MATRIC_INT = new int[6];
        int SOMA = 0;
        char DV = ' ';
        Array.Copy(MATRIC_CPT, MATRIC_SPT, MATRIC_SPT.Length);
        RemoverCaractere(MATRIC_SPT, '.');
        for (int I = 0; I <= 5; I++)
            MATRIC_INT[I] = MATRIC_SPT[I] - 48;
        for (int I = 0; I <= 5; I++)
            SOMA += MATRIC_INT[I] * (7 - I);
        if ((SOMA % 11) == 0)
            DV = (char)48; // DV = 0
        else if ((SOMA % 11) == 1)
            DV = (char)88; // DV = X
        else if ((SOMA % 11) == 10)
            DV = (char)49; // DV = 1
        else
            DV = (char)(11 - (SOMA % 11) + 48);
        return DV;
    }

    static void Main(string[] args)
    {
        char[] MATRICULA = new char[12];
        StreamWriter ARQUIVO = new StreamWriter("numeros.txt");

        Console.WriteLine("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"");
        Console.WriteLine("Padrao: Modulo 11");
        Console.WriteLine("---------------------------------------------------------------");
        Console.WriteLine();

        if (ARQUIVO == null)
        {
            Console.Error.WriteLine("Erro ao abrir o arquivo.");
            Console.WriteLine("Programa encerrado.");
            Console.WriteLine();
            return;
        }

        Console.Write("Aguarde arquivo sendo gerado... ");

        for (int I = 0; I <= 999999; I++)
        {
            string MATRICULA_STR = I.ToString("D6");
            MATRICULA_STR.CopyTo(0, MATRICULA, 0, MATRICULA_STR.Length);
            char DV = Mod11(MATRICULA);
            string MATRICULA_FORMATADA = string.Format("{0}.{1}-{2}", MATRICULA_STR.Substring(0, 3), MATRICULA_STR.Substring(3), DV);
            ARQUIVO.WriteLine(MATRICULA_FORMATADA);
        }

        ARQUIVO.Close();

        Console.WriteLine("\n\nSUCESSO: Arquivo gerado.\n");
    }
}
