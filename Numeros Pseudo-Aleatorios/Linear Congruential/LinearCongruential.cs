/**
 PRNG .......: Linear Congruential
 Ano ........: 1965
 Autor ......: W. E. Thomson
*/

using System;

class Program
{
    static double LinearCongruential(ref long seed)
    {
        const long M = 2147483647;
        seed = (1664525 * seed + 1013904223) % M;
        return (double)seed / M;
    }

    static void Main(string[] args)
    {
        long Xn1 = 1234;
        long Xn2 = (long)DateTime.Now.Ticks;

        Console.WriteLine("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        Console.WriteLine("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        Console.WriteLine("PADRAO: Linear Congruential");
        Console.WriteLine("==========================================");
        Console.WriteLine();
        Console.WriteLine("    Semente: 1234        Semente: TIME");
        Console.WriteLine("    -------------        -------------");

        for (int i = 1; i <= 10; i++)
        {
            Console.WriteLine($"{LinearCongruential(ref Xn1),17:F11}        {LinearCongruential(ref Xn2),13:F11}");
        }
    }
}
