using System;

class Program
{
    static bool ValidarMatricula(string MATRICULA)
    {
        if (MATRICULA.Length != 7)
            return false;
        if (!Char.IsDigit(MATRICULA[0]) || !Char.IsDigit(MATRICULA[6]))
            return false;
        if (MATRICULA[3] != '.')
            return false;
        for (int I = 1; I <= 2; I++)
            if (!Char.IsDigit(MATRICULA[I]) || !Char.IsDigit(MATRICULA[I + 4]))
                return false;
        return true;
    }

    static void RemoverCaractere(ref string CADEIA, char CARACTERE)
    {
        CADEIA = CADEIA.Replace(CARACTERE.ToString(), string.Empty);
    }

    static char Mod11(string MATRIC_CPT)
    {
        string MATRIC_SPT = MATRIC_CPT;
        RemoverCaractere(ref MATRIC_SPT, '.');
        int[] MATRIC_INT = new int[6];
        for (int I = 0; I <= 5; I++)
            MATRIC_INT[I] = MATRIC_SPT[I] - 48;
        int SOMA = 0;
        for (int I = 0; I <= 5; I++)
            SOMA += MATRIC_INT[I] * (7 - I);
        char DV;
        if ((SOMA % 11) == 0)
            DV = '0';
        else if ((SOMA % 11) == 1)
            DV = 'X';
        else if ((SOMA % 11) == 10)
            DV = '1';
        else
            DV = (char)((11 - (SOMA % 11)) + 48);
        return DV;
    }

    static void Main()
    {
        string MATRICULA;
        char DV;

        do
        {
            Console.Write("Informe matricula no formato 999.999: ");
            MATRICULA = Console.ReadLine();
            if (!ValidarMatricula(MATRICULA))
            {
                Console.WriteLine();
                Console.WriteLine("Matricula invalida. Tente novamente.");
                Console.WriteLine();
            }
        } while (!ValidarMatricula(MATRICULA));

        DV = Mod11(MATRICULA);
        Console.WriteLine();
        Console.WriteLine($"Matricula com DV = {MATRICULA}-{DV}");
        Console.WriteLine();
        Console.Write("Tecle <Enter> para encerrar... ");
        Console.ReadLine();
    }
}
