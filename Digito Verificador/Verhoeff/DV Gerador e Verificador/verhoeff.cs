using System;

public class Program
{
    // Tabela de multiplicacao >>> d(j, k)
    // k = 10 colunas
    // j = 10 linhas
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

    // Tabela de permutacao >>> p(pos, num)
    // num = 10 colunas
    // pos = 8 linhas (mod 8)
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

    // Tabela de inversao >>> inv(j)
    // j = 8 colunas
    //     1 linha
    static int[] verhoeffInv = { 0, 4, 3, 2, 1, 5, 6, 7, 8, 9 };

    // Gerar digito verificador no padrao Verhoeff
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
  
    // Validar digito verificador no padrao Verhoeff
    // Ultimo digito do numero fornecido
    public static bool ValidarVerhoeff(string NUMERO)
    {
        int DIGITO = 0, POS, NUM;
        int TAMANHO = NUMERO.Length;
        for (int I = 0; I < TAMANHO; I++)
        {
            POS = I % 8;
            NUM = NUMERO[TAMANHO - I - 1] - 48;
            DIGITO = verhoeffD[DIGITO, verhoeffP[POS, NUM]];
        }
        return DIGITO == 0;
    }
    
    // Remove a mascara do numero
    static string RemoverMascara(string NUMERO)
    {
        string NUMERO_SMASC = "";
        bool ENCONTROU_PRIMEIRO_DIGITO = false;
        foreach (char CARACTERE in NUMERO)
        {
            if (CARACTERE == '.')
                ENCONTROU_PRIMEIRO_DIGITO = true;
            else if (char.IsDigit(CARACTERE))
            {
                if (!ENCONTROU_PRIMEIRO_DIGITO && CARACTERE == '0')
                    continue;
                NUMERO_SMASC += CARACTERE;
            }
        }
        return NUMERO_SMASC;
    }

    public static void Main(string[] args)
    {
        int DV;
        bool entradaValida;
        string NUMERO;
        string NUMERO_COM_DV;
        string NUMERO_SEM_MASCARA_DV;

        entradaValida = false;
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
                entradaValida = true;
        } while (!entradaValida);

        string NUMERO_SMASC = RemoverMascara(NUMERO);
        DV = GerarVerhoeff(NUMERO_SMASC);
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
                entradaValida = true;
        } while (!entradaValida);

        NUMERO_SEM_MASCARA_DV = RemoverMascara(NUMERO_COM_DV);
        if (ValidarVerhoeff(NUMERO_SEM_MASCARA_DV))
            Console.WriteLine("Matricula valida.");
        else
            Console.WriteLine("Matricula invalida.");

        Console.ReadKey();
    }
}
