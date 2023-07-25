/*
 PRNG .......: Middle Square
 Ano ........: 1946
 Autor ......: John von Neumann
*/

using System;

public class Program
{

    public static long MeanSquare(ref long seed)
    {
        seed = (seed * seed / 100) % 10000;
        return seed < 0 ? seed + 10000 : seed;
    }

    public static void Main(string[] args)
    {

        long Xn1 = 1234;
        long Xn2 = DateTimeOffset.UtcNow.ToUnixTimeMilliseconds();

        Console.WriteLine("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        Console.WriteLine("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        Console.WriteLine("PADRAO: Middle Square");
        Console.WriteLine("==========================================\n");
        Console.WriteLine("    Semente: 1234        Semente: TIME");
        Console.WriteLine("    -------------        -------------\n");

        for (int i = 1; i <= 10; i++)
        {
            Xn1 = MeanSquare(ref Xn1);
            Xn2 = MeanSquare(ref Xn2);
            Console.WriteLine($"{Xn1,17}        {Xn2,13}");
        }

    }

}
