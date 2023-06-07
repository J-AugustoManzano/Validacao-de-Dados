import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Digite um texto .....: ");
        String texto = scanner.nextLine();

        String textoMaiusculo = texto.toUpperCase();
        String textoMinusculo = texto.toLowerCase();

        System.out.print("Texto em maiusculo ..: ");
        System.out.println(textoMaiusculo);

        System.out.print("Texto em minusculo ..: ");
        System.out.println(textoMinusculo);
    }
}
