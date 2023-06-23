/*
   PRNG .......: RANDU
   Ano ........: Decada de 1960
   Autor ......: IBM
*/

using System;

namespace PRNG
{
    class Program
    {
      
        static long RANDU(ref long seed)
        {
            seed = (65539 * seed) % 2147483648;
            return seed;
        }

        static void Main(string[] args)
        {
          
            long Xn1 = 1234;
            long Xn2 = DateTimeOffset.Now.ToUnixTimeSeconds();

            Console.WriteLine("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
            Console.WriteLine("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
            Console.WriteLine("PADRAO: RANDU");
            Console.WriteLine("==========================================");
            Console.WriteLine();
            Console.WriteLine("    Semente: 1234        Semente: TIME");
            Console.WriteLine("    -------------        -------------");

            for (int i = 1; i <= 10; i++)
              Console.WriteLine($"{RANDU(ref Xn1),17}        {RANDU(ref Xn2),13}");
          
        }
    }
  
}
