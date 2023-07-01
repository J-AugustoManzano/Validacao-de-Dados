/*
   PRNG .......: Linear-Feedback Shift Register (LFSR)
   Ano ........: 1965
   Autor ......: R. C. Tausworthe
*/

using System;

namespace LinearFeedbackShiftRegister
{

    class Program
    {
      
        static double Lfsr(ref uint state)
        {
            state = (state >> 1) ^ (0xB4BCD35C * (state & 1));
            return (double)state / 4294967296.0;
        }

        static void Main(string[] args)
        {
          
            uint Xn1, Xn2;
            int i;

            Xn1 = 0x1234;
            Xn2 = (uint)DateTime.Now.Ticks;

            Console.WriteLine("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
            Console.WriteLine("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
            Console.WriteLine("PADRAO: Linear-Feedback Shift Register");
            Console.WriteLine("==========================================\n");
            Console.WriteLine("    Semente: 1234        Semente: TIME");
            Console.WriteLine("    -------------        -------------\n");

            for (i = 1; i <= 10; i++)
            {
                Console.WriteLine("{0,17:F11}        {1,13:F11}", Lfsr(ref Xn1), Lfsr(ref Xn2));
            }
          
        }
      
    }
}
