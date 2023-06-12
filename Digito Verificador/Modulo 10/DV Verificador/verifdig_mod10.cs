// ValidarMatricula
using System;

class Program
{
    static bool ValidarMatricula(string MATRICULA)
    {
        if (MATRICULA.Length != 9)
            return false;
        if (!(char.IsDigit(MATRICULA[0])) || !(char.IsDigit(MATRICULA[1])) || !(char.IsDigit(MATRICULA[2])))
            return false;
        if (MATRICULA[3] != '.')
            return false;
        if (!(char.IsDigit(MATRICULA[4])) || !(char.IsDigit(MATRICULA[5])) || !(char.IsDigit(MATRICULA[6])))
            return false;
        if (MATRICULA[7] != '-')
            return false;
        if (!(char.IsDigit(MATRICULA[8])))
            return false;
        return true;
    }

    static void RemoverCaractere(ref string CADEIA, char CARACTERE)
    {
        CADEIA = CADEIA.Replace(CARACTERE.ToString(), string.Empty);
    }

    static int Mod10Check(string MATRICULA)
    {
        int[] MATRIC_INT = new int[6];
        int SOMA = 0;
        int DV = 0;
        for (int i = 0; i < 6; i++)
            MATRIC_INT[i] = int.Parse(MATRICULA[i].ToString());
        for (int i = 0; i < 6; i++)
        {
            if ((i + 1) % 2 == 0)
            {
                if (MATRIC_INT[i] * 2 > 9)
                    SOMA += MATRIC_INT[i] * 2 - 9;
                else
                    SOMA += MATRIC_INT[i] * 2;
            }
            else
            {
                SOMA += MATRIC_INT[i];
            }
        }
        DV = (10 - (SOMA % 10)) % 10;
        return DV;
    }

    static void Main(string[] args)
    {
        string MATRIC_CPT = "";
        string MATRIC_SPT = "";
        int[] MATRIC_INT = new int[7];
        int DVC = 0;
        int DVE = 0;

        do
        {
            Console.Write("Informe a matricula no formato 999.999-9: ");
            MATRIC_CPT = Console.ReadLine();
            if (!ValidarMatricula(MATRIC_CPT))
            {
                Console.WriteLine();
                Console.WriteLine("Entrada invalida, tente novamente.");
                Console.WriteLine();
                Console.WriteLine();
            }
        } while (!ValidarMatricula(MATRIC_CPT));

        MATRIC_SPT = MATRIC_CPT;
        RemoverCaractere(ref MATRIC_SPT, '.');
        RemoverCaractere(ref MATRIC_SPT, '-');
        DVC = Mod10Check(MATRIC_SPT);

        for (int i = 0; i < 7; i++)
            MATRIC_INT[i] = int.Parse(MATRIC_SPT[i].ToString());
        DVE = MATRIC_INT[6];

        Console.WriteLine();
        if (DVC == DVE)
            Console.WriteLine("Matricula valida.");
        else
            Console.WriteLine("Matricula invalida.");
        Console.WriteLine();

        Console.Write("Pressione <Enter> para encerrar... ");
        Console.ReadLine();
    }
}
