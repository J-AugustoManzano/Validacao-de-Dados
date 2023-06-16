/**
 * PRNG .......: Wichmann Hill
 * Ano ........: 1982
 * Autor ......: Brian A. Wichmann & David H. Hill
 */

using System;

class Program
{
    static double WichmannHill(ref int X)
    {
        X = (171 * X) % 30269;
        return Math.Abs(X / 30269.0);
    }

    static void Main()
    {
        Console.WriteLine("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        Console.WriteLine("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        Console.WriteLine("PADRAO: Wichmann Hill");
        Console.WriteLine("==========================================\n");

        Console.WriteLine("    Semente: 1234        Semente: TIME");
        Console.WriteLine("    -------------        -------------\n");

        int i;
        double[] semente1234 = new double[10];
        double[] sementeTime = new double[10];
        int X1, X2;

        X1 = 1234;
        for (i = 0; i <= 9; i++)
        {
            semente1234[i] = WichmannHill(ref X1);
        }

        X2 = (int)DateTime.Now.Ticks;
        for (i = 0; i <= 9; i++)
        {
            sementeTime[i] = WichmannHill(ref X2);
        }

        for (i = 0; i <= 9; i++)
        {
            Console.Write(semente1234[i].ToString("F11").PadLeft(17));
            Console.Write("    ");
            Console.WriteLine(sementeTime[i].ToString("F11").PadLeft(17));
        }
    }
    
}
