// GerarMatricula
using System;

class Program
{
    static bool ValidarMatricula(string MATRICULA)
    {
        if (MATRICULA.Length != 7)
            return false;
        if (!char.IsDigit(MATRICULA[0]) || !char.IsDigit(MATRICULA[6]))
            return false;
        if (MATRICULA[3] != '.')
            return false;
        for (int I = 1; I <= 2; I++)
            if (!char.IsDigit(MATRICULA[I]) || !char.IsDigit(MATRICULA[I + 4]))
                return false;
        return true;
    }
    static string RemoverCaractere(string CADEIA, char CARACTERE)
    {
        return CADEIA.Replace(CARACTERE.ToString(), string.Empty);
    }

    static int Mod10(string MATRICULA)
    {
        int[] MATRIC_INT = new int[6];
        int SOMA = 0;
        for (int I = 0; I <= 5; I++)
            MATRIC_INT[I] = int.Parse(MATRICULA[I].ToString());
        for (int I = 0; I <= 5; I++)
        {
            if (I % 2 != 0 && MATRIC_INT[I] * 2 > 9)
                SOMA += MATRIC_INT[I] * 2 - 9;
            else if (I % 2 != 0 && MATRIC_INT[I] * 2 <= 9)
                SOMA += MATRIC_INT[I] * 2;
            if (I % 2 == 0)
                SOMA += MATRIC_INT[I];
        }
        int DV = (SOMA / 10 + 1) * 10 - SOMA;
        return DV;
    }

    static void Main(string[] args)
    {
      
        string MATRIC_CPT;
        string MATRIC_SPT;
        int DV;

        do
        {
            Console.Write("Informe matricula no formato 999.999: ");
            MATRIC_CPT = Console.ReadLine();

            if (!ValidarMatricula(MATRIC_CPT))
            {
                Console.WriteLine();
                Console.WriteLine("Matricula invalida. Tente novamente.\n");
                Console.WriteLine();
            }
        } while (!ValidarMatricula(MATRIC_CPT));
        
        MATRIC_SPT = RemoverCaractere(MATRIC_CPT, '.');
        DV = Mod10(MATRIC_SPT);
        Console.WriteLine();
        Console.WriteLine("Matricula com DV = {0}-{1}", MATRIC_CPT, DV);
        Console.WriteLine();
        Console.Write("Tecle <Enter> para encerrar...");
        Console.ReadLine();
    }
}
