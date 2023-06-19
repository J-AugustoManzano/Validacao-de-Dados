/**
 * PRNG .......: Park-Miller
 * Ano ........: 1988
 * Autor ......: S. K. Park & K. W. Miller
 */

using System;

namespace ParkMillerPRNG
{
    class Program
    {

        static ulong ParkMiller(ref ulong X)
        {
            X = (16807 * X) % 2147483647;
            return X;
        }

        static void Main(string[] args)
        {
			
            ulong Xn1, Xn2;
            int i;

            Xn1 = 1234;
            Xn2 = (ulong)DateTime.Now.Ticks;

            Console.WriteLine("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
            Console.WriteLine("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
            Console.WriteLine("PADRAO: Park-Miller");
            Console.WriteLine("==========================================");
            Console.WriteLine();
            Console.WriteLine("    Semente: 1234        Semente: TIME");
            Console.WriteLine("    -------------        -------------");

            for (i = 1; i <= 10; i++)
                Console.WriteLine($"{ParkMiller(ref Xn1),17}        {ParkMiller(ref Xn2),13}");
          
        }

    }
}
