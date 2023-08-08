/*
 PRNG .......: XorShift (32 bits)
 Ano ........: 2003
 Autor ......: George Marsaglia
*/

using System;

public class MainClass
{

    public class XorShift32State
    {
        public uint seed;
    }

    public static uint xorshift32(XorShift32State state)
    {
        uint random = state.seed;
        random ^= random << 13;
        random ^= random >> 17;
        random ^= random << 5;
        state.seed = random;
        return random;
    }

    public static void Main(string[] args)
    {
		
        XorShift32State Xn1 = new XorShift32State();
        XorShift32State Xn2 = new XorShift32State();

        Xn1.seed = 1234;
        Xn2.seed = (uint)DateTime.Now.Ticks;

        Console.WriteLine("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        Console.WriteLine("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        Console.WriteLine("PADRAO: XorShift (32 bits)");
        Console.WriteLine("=============================================");
        Console.WriteLine();
        Console.WriteLine("      Semente: 1234       Semente: TIME");
        Console.WriteLine("      -------------       -------------");

        for (int i = 1; i <= 10; i++)
        {
            Console.WriteLine($"{xorshift32(Xn1),19}{xorshift32(Xn2),20}");
        }
        
    }
    
}
