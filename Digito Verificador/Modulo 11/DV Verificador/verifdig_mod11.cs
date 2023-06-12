using System;

class Program
{
    static bool ValidarMatricula(string MATRICULA)
    {
        int TAMANHO = MATRICULA.Length;
        if (TAMANHO != 9)
            return false;
        if (MATRICULA[3] != '.' || MATRICULA[7] != '-')
            return false;
        for (int I = 0; I < TAMANHO; I++)
            if (I != 3 && I != 7 && !char.IsDigit(MATRICULA[I]))
                return false;
        return true;
    }

    static void RemoverCaractere(ref string CADEIA, char CARACTERE)
    {
        CADEIA = CADEIA.Replace(CARACTERE.ToString(), "");
    }

    static char Mod11Check(string MATRIC_CPT)
    {
        string MATRIC_SPT = MATRIC_CPT;
        int[] MATRIC_INT = new int[6];
        int I, SOMA = 0;
        char DV;
        RemoverCaractere(ref MATRIC_SPT, '.');
        for (I = 0; I <= 5; I++)
            MATRIC_INT[I] = MATRIC_SPT[I] - 48; // ASCII 48 = "0"
        for (I = 0; I <= 5; I++)
            SOMA += MATRIC_INT[I] * (7 - I);
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
        char DVC, DVE;

        do
        {
            Console.Write("Informe matricula no formato 999.999-9: ");
            MATRICULA = Console.ReadLine();
            if (!ValidarMatricula(MATRICULA))
            {
                Console.WriteLine();
                Console.WriteLine("Matricula invalida. Tente novamente.");
                Console.WriteLine();
            }
        } while (!ValidarMatricula(MATRICULA));

        DVC = Mod11Check(MATRICULA);
        DVE = MATRICULA[8];
        Console.WriteLine();
        if (char.ToUpper(DVC) == char.ToUpper(DVE))
            Console.WriteLine("Numero de matricula valido");
        else
            Console.WriteLine("Numero de matricula invalido");
        Console.WriteLine();
        Console.Write("Tecle <Enter> para encerrar... ");
        Console.ReadLine();
    }
}
