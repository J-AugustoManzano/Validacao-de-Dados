/**
 * PRNG .......: Mersenne Twister (MT)
 * Ano ........: 1998
 * Autor ......: Makoto Matsumoto & Takuji Nishimura
 */

public class Main {
	
    public static class MT19937 {
        private int w = 32;
        private int n = 624;
        private int f = 1812433253;
        private int m = 397;
        private int r = 31;
        private int a = 0x9908B0DF;
        private int d = 0xFFFFFFFF;
        private int b = 0x9D2C5680;
        private int c = 0xEFC60000;
        private int u = 11;
        private int s = 7;
        private int t = 15;
        private int l = 18;

        private int[] X = new int[n];
        private int cnt = 0;

        private void twist() {
            for (int i = 0; i < n; i++) {
                int lower_mask = (1 << r) - 1;
                int upper_mask = ~lower_mask;
                int tmp = (X[i] & upper_mask) + (X[(i + 1) % n] & lower_mask);
                int tmpA = tmp >> 1;
                if ((tmp & 1) != 0) {
                    tmpA ^= a;
                }
                X[i] = X[(i + m) % n] ^ tmpA;
            }
            cnt = 0;
        }

        public void initialize(int seed) {
            X[0] = seed;
            for (int i = 1; i < n; i++) {
                X[i] = (f * (X[i - 1] ^ (X[i - 1] >> (w - 2))) + i) & 0xFFFFFFFF;
            }
            twist();
        }

        public int generateRandomNumber() {
            if (cnt == n) {
                twist();
            }
            int y = X[cnt];
            y ^= (y >> u) & d;
            y ^= (y << s) & b;
            y ^= (y << t) & c;
            y ^= y >> l;
            cnt++;
            return y;
        }
    }

    public static void main(String[] args) {
		
        MT19937 Xn1 = new MT19937();
        MT19937 Xn2 = new MT19937();

        Xn1.initialize(1234);
        Xn2.initialize((int) System.currentTimeMillis());

        System.out.println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        System.out.println("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        System.out.println("PADRAO: Mersenne Twister (MT)");
        System.out.println("==========================================\n");
        System.out.println("    Semente: 1234        Semente: TIME");
        System.out.println("    -------------        -------------\n");

        for (int i = 0; i <= 9; i++) {
            System.out.printf("%17s", Xn1.generateRandomNumber());
            System.out.printf("%21s\n", Xn2.generateRandomNumber());
        }
        
    }
    
}
