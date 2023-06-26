using System;

public class MainClass
{
    public static int Lehmer(ref int seed)
    {
        seed = (16807 * seed) % 2147483647;
        return Math.Abs(seed);
    }

    public static void Main(string[] args)
    {
        Console.WriteLine("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        Console.WriteLine("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        Console.WriteLine("PADRAO: Lehmer");
        Console.WriteLine("==========================================\n");
        Console.WriteLine("    Semente: 1234        Semente: TIME");
        Console.WriteLine("    -------------        -------------");

        int Xn1 = 1234;
        int Xn2 = (int)(DateTime.Now.Ticks / TimeSpan.TicksPerSecond);

        for (int i = 1; i <= 10; i++)
        {
            Xn1 = Lehmer(ref Xn1);
            Xn2 = Lehmer(ref Xn2);
            Console.WriteLine($"{Xn1,17}        {Xn2,13}");
        }
    }
}
