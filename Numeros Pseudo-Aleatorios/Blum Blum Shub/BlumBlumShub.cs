/**
 * PRNG .......: Blum-Blum-Shub
 * Ano ........: 1986
 * Autor ......: L. Blum, M. Blum & M. Shub
 */

using System;

namespace BlumBlumShubPRNG
{
    class Program
    {
        static ulong BlumBlumShub(ref ulong X)
        {
            X = (X * X) % 2467246241;
            return X;
        }

        static ulong[] Xn1 = new ulong[10];
        static ulong[] Xn2 = new ulong[10];
        static ulong X1, X2;

        static void Main(string[] args)
        {
            Console.WriteLine("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
            Console.WriteLine("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
            Console.WriteLine("PADRAO: Blum-Blum-Shub");
            Console.WriteLine("==========================================\n");
            Console.WriteLine("    Semente: 1234        Semente: TIME");
            Console.WriteLine("    -------------        -------------");

            X1 = 1234;
            for (int i = 0; i <= 9; i++)
            {
                Xn1[i] = BlumBlumShub(ref X1);
            }

            X2 = (ulong)DateTime.Now.Ticks;
            for (int i = 0; i <= 9; i++)
            {
                Xn2[i] = BlumBlumShub(ref X2);
            }

            for (int i = 0; i <= 9; i++)
            {
                Console.WriteLine($"{Xn1[i],17}        {Xn2[i],13}");
            }
        }
    }
}
