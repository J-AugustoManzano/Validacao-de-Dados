/**
 * PRNG .......: Mersenne Twister (MT)
 * Ano ........: 1998
 * Autor ......: Makoto Matsumoto & Takuji Nishimura
*/

using System;

public class Program
{
    public class MT19937
    {
        private int w = 32;
        private int n = 624;
        private uint f = 1812433253;
        private int m = 397;
        private int r = 31;
        private uint a = 0x9908B0DF;
        private uint d = 0xFFFFFFFF;
        private uint b = 0x9D2C5680;
        private uint c = 0xEFC60000;
        private int u = 11;
        private int s = 7;
        private int t = 15;
        private int l = 18;

        private int[] X = new int[624];
        private int cnt = 0;

        private void Twist()
        {
            for (int i = 0; i < n; i++)
            {
                int lower_mask = (1 << r) - 1;
                int upper_mask = ~lower_mask;
                int tmp = (X[i] & upper_mask) + (X[(i + 1) % n] & lower_mask);
                int tmpA = tmp >> 1;
                if ((tmp & 1) != 0)
                {
                    tmpA ^= (int)a;
                }
                X[i] = X[(i + m) % n] ^ tmpA;
            }
            cnt = 0;
        }

        public void Initialize(int seed)
        {
            X[0] = seed;
            for (int i = 1; i < n; i++)
            {
                long value = (long)f * (X[i - 1] ^ (X[i - 1] >> (w - 2))) + i;
                X[i] = (int)(value & 0xFFFFFFFF);
            }
            Twist();
        }

        public int GenerateRandomNumber()
        {
            if (cnt == n)
            {
                Twist();
            }
            int y = X[cnt];
            y ^= (y >> u) & (int)d;
            y ^= (y << s) & (int)b;
            y ^= (y << t) & (int)c;
            y ^= y >> l;
            cnt++;
            return y;
        }
    }

    public static void Main(string[] args)
    {
		
        MT19937 rng1 = new MT19937();
        MT19937 rng2 = new MT19937();

        rng1.Initialize(1234);
        rng2.Initialize((int)DateTimeOffset.UtcNow.ToUnixTimeMilliseconds());

        Console.WriteLine("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        Console.WriteLine("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        Console.WriteLine("PADRAO: Mersenne Twister (MT)");
        Console.WriteLine("==========================================\n");
        Console.WriteLine("    Semente: 1234        Semente: TIME");
        Console.WriteLine("    -------------        -------------\n");

        for (int i = 0; i < 10; i++)
        {
            Console.Write($"{rng1.GenerateRandomNumber(),17}");
            Console.WriteLine($"{rng2.GenerateRandomNumber(),21}");
        }
    }
    
}
