import java.util.Date;

public class Main {

    public static int Lehmer(int seed) {
        seed = (16807 * seed) % 2147483647;
        if (seed < 0) {
            seed += 2147483647;
        }
        return seed;
    }

    public static void main(String[] args) {

        System.out.println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        System.out.println("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        System.out.println("PADRAO: Lehmer");
        System.out.println("==========================================\n");
        System.out.println("    Semente: 1234        Semente: TIME");
        System.out.println("    -------------        -------------");

        int Xn1 = 1234;
        int Xn2 = (int) (new Date().getTime() / 1000);

        for (int i = 1; i <= 10; i++) {
            Xn1 = Lehmer(Xn1);
            Xn2 = Lehmer(Xn2);
            System.out.format("%17d        %13d\n", Xn1, Xn2);
        }

    }

}
