/*
 PRNG .......: XorShift (64 bits)
 Ano ........: 2003
 Autor ......: George Marsaglia
*/

using System;

public class Program
{
    private class XorShift64State
    {
        public long seed;

        public XorShift64State(long seed)
        {
            this.seed = seed;
        }
    }

    private static long xorShift64(XorShift64State state)
    {
        long random = state.seed;
        random ^= random << 13;
        random ^= random >> 7;
        random ^= random << 17;
        state.seed = random;
        return random & 0x7FFFFFFFFFFFFFFF; // Apenas os 63 bits mais significativos
    }

    public static void Main(string[] args)
    {
        XorShift64State Xn1 = new XorShift64State(1234L);
        XorShift64State Xn2 = new XorShift64State(DateTimeOffset.Now.ToUnixTimeMilliseconds());

        Console.WriteLine("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        Console.WriteLine("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        Console.WriteLine("PADRAO: XorShift (64 bits)");
        Console.WriteLine("=================================================");
        Console.WriteLine();
        Console.WriteLine("   Semente: 1234          Semente: TIME");
        Console.WriteLine("   --------------------   --------------------");

        for (int i = 1; i <= 10; i++)
        {
            Console.WriteLine($"{xorShift64(Xn1),23}{xorShift64(Xn2),23}");
        }
    }
}
