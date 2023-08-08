/*
 PRNG .......: XorShift (128 bits)
 Ano ........: 2003
 Autor ......: George Marsaglia
*/

using System;

public class XorShift128State
{
    public ulong seed;
}

public class Program
{
    public static ulong XorShift128(ref XorShift128State state)
    {
        ulong random = state.seed;
        random ^= random << 11;
        random ^= random >> 8;
        random ^= random << 19;
        state.seed = random;
        return random;
    }

    public static void Main()
    {
        var Xn1 = new XorShift128State();
        var Xn2 = new XorShift128State();

        Xn1.seed = 1234;
        Xn2.seed = (ulong)DateTime.Now.Ticks;

        Console.WriteLine("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        Console.WriteLine("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        Console.WriteLine("PADRAO: XorShift (128 bits)");
        Console.WriteLine("=================================================");
        Console.WriteLine();
        Console.WriteLine("   Semente: 1234          Semente: TIME");
        Console.WriteLine("   --------------------   --------------------");

        for (int i = 1; i <= 10; i++)
        {
            Console.WriteLine($"{XorShift128(ref Xn1),23}{XorShift128(ref Xn2),23}");
        }
    }
}
