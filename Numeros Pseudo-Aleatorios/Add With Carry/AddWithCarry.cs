/*
 PRNG .......: Add With Carry (AWC)
 Ano ........: 1991
 Autor ......: George Marsaglia
*/

using System;
using System.Globalization;

class Program
{

    static ulong AWCNextRandom(ref ulong Xn)
    {
        Xn = (Xn + 12345) % 4294967296;
        return Xn;
    }

    static void AWCInitialize(ulong seed, ref ulong Xn)
    {
        Xn = seed;
    }

    static void Main()
    {

        Console.WriteLine("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        Console.WriteLine("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        Console.WriteLine("PADRAO: Add With Carry");
        Console.WriteLine("=========================================");
        Console.WriteLine();
        Console.WriteLine("    Semente: 1234        Semente: TIME");
        Console.WriteLine("    -------------        -------------");

        ulong Xn1 = 0, Xn2 = 0; // Inicialização com valor padrão
        int i;
        ulong seed1, seed2;

        seed1 = 1234;
        AWCInitialize(seed1, ref Xn1);

        seed2 = (ulong)DateTime.Now.Ticks;
        AWCInitialize(seed2, ref Xn2);

        for (i = 1; i <= 10; i++)
        {
            Console.WriteLine($"{AWCNextRandom(ref Xn1),17}        {AWCNextRandom(ref Xn2),13}");
        }

    }

}
