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
        return X / 30269.0;
    }

    static void Main()
    {
		
        double[] Xn1 = new double[10];
        double[] Xn2 = new double[10];
        int i, X1, X2;

        Console.WriteLine("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        Console.WriteLine("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        Console.WriteLine("PADRAO: Wichmann Hill");
        Console.WriteLine("==========================================\n");

        Console.WriteLine("    Semente: 1234        Semente: TIME");
        Console.WriteLine("    -------------        -------------\n");

        X1 = 1234;
        X2 = (int)DateTime.Now.Ticks;
        
        for (i = 0; i <= 9; i++)
        {
            Xn1[i] = WichmannHill(ref X1);
            Xn2[i] = WichmannHill(ref X2);
            Console.Write(Xn1[i].ToString("F11").PadLeft(17));
            Console.Write("    ");
            Console.WriteLine(Xn2[i].ToString("F11").PadLeft(17));
        }
        
    }
    
}
