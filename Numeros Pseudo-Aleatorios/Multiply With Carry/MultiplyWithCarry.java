/*
 PRNG .......: Multiply With Carry (MWC)
 Ano ........: Desconhecido
 Autor ......: George Marsaglia
*/

// Renomeie este projeto para "CmwcRnd.java"

public class CmwcRnd {
	
    private int[] randomValues;
    private int carry;
    private int currentIndex;

    private int log2ibase(int n, int acc) {
        if (n == 1)
            return acc;
        else
            return log2ibase(n >> 1, acc + 1);
    }

    private int log2i(int n) {
        return log2ibase(n, 0);
    }

    private int rand32() {
        int seed = 0;
        int result = 0;
        int bits = log2i(Integer.MAX_VALUE) + 1;
        int remainingBits = 32 - bits;
        do {
            result = result << bits | ((seed = (seed * 1103515245 + 12345) & 0xFFFFFFFF) >>> (32 - bits));
            remainingBits -= bits;
        } while (! (remainingBits <= 0));
        return result;
    }

    public CmwcRnd() {
        randomValues = new int[4096];
        currentIndex = 0;
    }

    public void initCMWC(int seed) {
        for (int i = 0; i <= 4095; i++) {
            seed = (seed * 1103515245 + 12345) & 0xFFFFFFFF;
            randomValues[i] = seed;
        }
        do {
            seed = (seed * 1103515245 + 12345) & 0xFFFFFFFF;
            carry = seed;
        } while (! (carry < 809430660));
        currentIndex = 4095;
    }

    public int randCMWC() {
        long t;
        long x;
        currentIndex = (currentIndex + 1) & 4095;
        t = 18782L * randomValues[currentIndex] + carry;
        carry = (int) (t >> 32);
        x = t + carry;
        if (x < carry) {
            x++;
            carry++;
        }
        return (int) (0xffffffffL - x);
    }

    public static void main(String[] args) {
		
        CmwcRnd cmwc1 = new CmwcRnd();
        CmwcRnd cmwc2 = new CmwcRnd();
        
        int Xn1 = 1234;
        int Xn2 = (int) System.currentTimeMillis();

        cmwc1.initCMWC(Xn1);
        cmwc2.initCMWC(Xn2);

        System.out.println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        System.out.println("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        System.out.println("PADRAO: Multiply With Carry (MWC)");
        System.out.println("=========================================");
        System.out.println();
        System.out.println("    Semente: 1234        Semente: TIME");
        System.out.println("    -------------        -------------");

        for (int i = 1; i <= 10; i++) {
            System.out.printf("%17d        %13d%n", cmwc1.randCMWC() & 0xffffffffL, cmwc2.randCMWC() & 0xffffffffL);
        }
        
    }
    
}
