/*
 * PRNG .......: Permuted Congruential Generator (PCG)
 * Ano ........: 2014
 * Autor ......: Dr. M.E. O'Neill
 */

using System;
using System.Diagnostics;

public class Program
{

    private static uint rotr32(uint x, int r)
    {
        return (x >> r) | (x << (-r & 31));
    }

    private static uint pcg32(ref long seed)
    {
        long x = seed;
        int rotation = (int)(x >> 59);
        seed = x * 6364136223846793005L + 1442695040888963407L;
        x ^= x >> 18;
        seed += x;
        return rotr32((uint)(((x >> 27) + rotation) ^ (seed >> 32)), rotation);
    }

    private static uint GetTimer()
    {
        var current_time = DateTime.UtcNow;
        var millis = (long)(current_time - new DateTime(1970, 1, 1)).TotalMilliseconds;
        return (uint)millis;
    }

    private static long Xn1, Xn2;

    public static void Main(string[] args)
    {
        Console.WriteLine("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        Console.WriteLine("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        Console.WriteLine("PADRAO: Permuted Congruential Generator (PCG)");
        Console.WriteLine("=============================================");
        Console.WriteLine();

        Xn1 = 1234;
        Xn2 = GetTimer();

        Console.WriteLine("      Semente: 1234       Semente: TIME");
        Console.WriteLine("      -------------       -------------");

        for (int i = 1; i <= 10; i++)
        {
            Console.Write($"{pcg32(ref Xn1),19}");
            Console.WriteLine($"{pcg32(ref Xn2),20}");
        }
    }
}
