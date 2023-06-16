using System;

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

    static int gerarDamm(string NUMERO)
    {
        int DV = 0, I;
        for (I = 0; I < NUMERO.Length; I++)
        {
            DV = dammTab[DV][int.Parse(NUMERO[I].ToString())];
        }
        return DV;
    }

    static bool validarDamm(string NUMERO)
    {
        int DV = 0, I;
        for (I = 0; I < NUMERO.Length; I++)
        {
            DV = dammTab[DV][int.Parse(NUMERO[I].ToString())];
        }
        return DV == 0;
    }

    static string RemoverMascara(string NUMERO)
    {
        string NUMERO_SMASC = "";
        bool ENCONTROU_PRIMEIRO_DIGITO = false;

        foreach (char CARACTERE in NUMERO)
        {
            if (CARACTERE == '.')
                ENCONTROU_PRIMEIRO_DIGITO = true;
            else if (Char.IsDigit(CARACTERE))
            {
                if (!ENCONTROU_PRIMEIRO_DIGITO && CARACTERE == '0')
                    continue;
                NUMERO_SMASC += CARACTERE;
            }
        }

        return NUMERO_SMASC;
    }

    static void Main(string[] args)
    {
        bool entradaValida = false;
        string NUMERO, NUMERO_COM_DV, NUMERO_SEM_MASCARA_DV, NUMERO_SMASC;
        int DV;

        do
        {
            Console.Write("Entre matricula no formato 999.999: ");
            NUMERO = Console.ReadLine();
            Console.WriteLine();
            if (NUMERO.Length != 7 || NUMERO[3] != '.')
            {
                Console.WriteLine();
                Console.WriteLine("Matricula invalida. Tente novamente.");
                Console.WriteLine();
            }
            else
            {
                entradaValida = true;
            }
        } while (!entradaValida);

        NUMERO_SMASC = RemoverMascara(NUMERO);
        DV = gerarDamm(NUMERO_SMASC);
        Console.WriteLine("Digito verificador: " + DV);
        Console.WriteLine();

        entradaValida = false;
        do
        {
            Console.Write("Entre matricula e digito verificador no formato 999.999-9: ");
            NUMERO_COM_DV = Console.ReadLine();
            Console.WriteLine();
            if (NUMERO_COM_DV.Length != 9 || NUMERO_COM_DV[3] != '.' || NUMERO_COM_DV[7] != '-')
            {
                Console.WriteLine();
                Console.WriteLine("Matricula invalida. Tente novamente.");
                Console.WriteLine();
            }
            else
            {
                entradaValida = true;
            }
        } while (!entradaValida);

        NUMERO_SEM_MASCARA_DV = RemoverMascara(NUMERO_COM_DV);
        if (validarDamm(NUMERO_SEM_MASCARA_DV))
        {
            Console.WriteLine("Matricula valida.");
        }
        else
        {
            Console.WriteLine("Matricula invalida.");
        }
    }
}
