/*
 PRNG .......: Multiply With Carry (MWC)
 Ano ........: Desconhecido
 Autor ......: George Marsaglia
*/

using System;

public class CmwcRnd
{
	
    private int[] randomValues;
    private int carry;
    private int currentIndex;

    private int log2ibase(int n, int acc)
    {
        if (n == 1)
            return acc;
        else
            return log2ibase(n >> 1, acc + 1);
    }

    private int log2i(int n)
    {
        return log2ibase(n, 0);
    }

    public CmwcRnd()
    {
        randomValues = new int[4096];
        currentIndex = 0;
    }

    public void initCMWC(int seed)
    {
        for (int i = 0; i <= 4095; i++)
        {
            seed = (int)((seed * 1103515245L + 12345) & 0xFFFFFFFF);
            randomValues[i] = seed;
        }

        do
        {
            seed = (int)((seed * 1103515245L + 12345) & 0xFFFFFFFF);
            carry = seed;
        } while (!(carry < 809430660));

        currentIndex = 4095;
    }

    public int randCMWC()
    {
        long t;
        long x;
        currentIndex = (currentIndex + 1) & 4095;
        t = 18782L * randomValues[currentIndex] + carry;
        carry = (int)(t >> 32);
        x = t + carry;
        if (x < carry)
        {
            x++;
            carry++;
        }
        return (int)(x & 0x7FFFFFFF); // Retorna valor positivo
    }

    public static void Main(string[] args)
    {
		
        CmwcRnd cmwc1 = new CmwcRnd();
        CmwcRnd cmwc2 = new CmwcRnd();
        
        int Xn1 = 1234;
        int Xn2 = (int)DateTimeOffset.UtcNow.ToUnixTimeMilliseconds();

        cmwc1.initCMWC(Xn1);
        cmwc2.initCMWC(Xn2);

        Console.WriteLine("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        Console.WriteLine("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        Console.WriteLine("PADRAO: Multiply With Carry (MWC)");

        Console.WriteLine("\n    Semente: 1234        Semente: TIME");
        Console.WriteLine("    -------------        -------------");

        for (int i = 1; i <= 10; i++)
        {
            Console.WriteLine($"{cmwc1.randCMWC(),17}           {cmwc2.randCMWC(),10}");
        }
        
    }
    
}
