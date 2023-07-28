/*
 PRNG .......: SplitMix64
 Ano ........: 2015
 Autor ......: Sebastiano Vigna
*/

// Fundamentado: rosettacode.org/wiki/Pseudo-random_numbers/Splitmix64

using System;

public class SplitMix64
{
    private ulong state;

    public SplitMix64(ulong seed)
    {
        state = seed;
    }

    public ulong NextInt()
    {
        state += 0x9e3779b97f4a7c15;
        ulong z = state;
        z = (z ^ (z >> 30)) * 0xbf58476d1ce4e5b9;
        z = (z ^ (z >> 27)) * 0x94d049bb133111eb;
        return z ^ (z >> 31);
    }

    public double NextFloat()
    {
        return (double)(NextInt() >> 11) / (1UL << 53);
    }
}

public class Program
{
    private static void Main()
    {
		
        SplitMix64 Xn1 = new SplitMix64(1234);
        SplitMix64 Xn2 = new SplitMix64((ulong)DateTime.Now.Ticks);

        Console.WriteLine("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        Console.WriteLine("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        Console.WriteLine("PADRAO: SplitMix64");
        Console.WriteLine("===================================================");

        Console.WriteLine();
        Console.WriteLine("  Semente: 1234 (int)        Semente: TIME (int)");
        Console.WriteLine("  --------------------       --------------------");
        for (int i = 1; i <= 5; i++)
        {
            Console.Write("{0,22}", Xn1.NextInt());
            Console.WriteLine("{0,27}", Xn2.NextInt());
        }

        Console.WriteLine();
        Console.WriteLine("  Semente: 1234 (real)       Semente: TIME (real)");
        Console.WriteLine("  --------------------       --------------------");
        for (int i = 1; i <= 5; i++)
        {
            Console.Write("{0,22:F18}", Xn1.NextFloat());
            Console.WriteLine("{0,27:F18}", Xn2.NextFloat());
        }
        
    }
}
