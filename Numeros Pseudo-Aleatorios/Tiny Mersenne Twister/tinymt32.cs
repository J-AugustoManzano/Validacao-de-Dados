/*
 PRNG .......: Tiny Mersenne Twister (TMT)
 Ano ........: 2015 (version 1.1)
 Autor ......: Mutsuo Saito & Makoto Matsumoto
*/

using System;

public class Tinymt32PRNG
{
    private uint[] status;
    private uint matrixAlpha;
    private uint matrixBeta;
    private uint tempCoeff;

    public Tinymt32PRNG()
    {
        status = new uint[4];
        matrixAlpha = 0x8f7011ee;
        matrixBeta = 0xfc78ff1f;
        tempCoeff = 0x3793fdff;
    }

    private void Tinymt32NextState()
    {
        uint stateX = (status[0] & 0x7fffffff) ^ status[1] ^ status[2];
        stateX ^= stateX << 1;
        uint stateY = status[3];
        stateY ^= stateY >> 1 ^ stateX;
        status[0] = status[1];
        status[1] = status[2];
        status[2] = stateX ^ (stateY << 10);
        status[3] = stateY;
        if ((stateY & 1) == 1)
        {
            status[1] ^= matrixAlpha;
            status[2] ^= matrixBeta;
        }
    }

    private uint Tinymt32Temp()
    {
        uint finalValue = status[3];
        uint tempCalc = status[0] + (status[2] >> 8);
        finalValue ^= tempCalc;
        finalValue ^= ((tempCalc & 1) != 0) ? tempCoeff : 0;
        return finalValue;
    }

    public void Tinymt32Init(uint seed)
    {
        status[0] = seed;
        status[1] = matrixAlpha;
        status[2] = matrixBeta;
        status[3] = tempCoeff;
        for (uint i = 1; i <= 7; i++)
        {
            status[i & 3] ^= i + 1812433253 * (status[(i - 1) & 3] ^ (status[(i - 1) & 3] >> 30));
        }
        for (uint i = 0; i <= 7; i++)
        {
            Tinymt32NextState();
        }
    }

    public uint Tinymt32Gen()
    {
        Tinymt32NextState();
        return Tinymt32Temp();
    }
}

public class Program
{
    public static void Main()
    {
        uint Xn1, Xn2;

        Tinymt32PRNG seed1 = new Tinymt32PRNG();
        Tinymt32PRNG seed2 = new Tinymt32PRNG();

        seed1.Tinymt32Init(1234);
        seed2.Tinymt32Init((uint)DateTimeOffset.Now.ToUnixTimeSeconds());

        Console.WriteLine("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        Console.WriteLine("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        Console.WriteLine("PADRAO: Tiny Mersenne Twister (TMT)");
        Console.WriteLine("=============================================");
        Console.WriteLine();
        Console.WriteLine("      Semente: 1234       Semente: TIME");
        Console.WriteLine("      -------------       -------------");

        for (int i = 1; i <= 10; i++)
        {
            Xn1 = seed1.Tinymt32Gen();
            Xn2 = seed2.Tinymt32Gen();
            Console.WriteLine($"{Xn1,19}{Xn2,20}");
        }
    }
}
