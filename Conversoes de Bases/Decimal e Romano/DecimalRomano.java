import java.util.Scanner;

public class Main { // DecimalRomano
    private static final String[] ALGARISMOS_ROMANOS = {"I", "IV", "V", "IX", "X", "XL", "L", "XC", "C", "CD", "D", "CM", "M"};
    private static final int[] VALORES_DECIMAIS = {1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000};
    private static final int LIMITE_MAXIMO_DECIMAL = 3999;
    private static final String LIMITE_MAXIMO_ROMANO = "MMMCMXCIX";

    public static String decimalParaRomano(int decimal) {
        StringBuilder romano = new StringBuilder();
        int i = 12;
        while (decimal > 0) {
            if (decimal >= VALORES_DECIMAIS[i]) {
                romano.append(ALGARISMOS_ROMANOS[i]);
                decimal -= VALORES_DECIMAIS[i];
            } else {
                i--;
            }
        }
        return romano.toString();
    }

    public static int romanoParaDecimal(String romano) {
        int resultado = 0;
        int valorAnterior = 0;
        romano = romano.toUpperCase();
        for (int i = romano.length() - 1; i >= 0; i--) {
            boolean valorEncontrado = false;
            for (int j = 0; j < 13; j++) {
                if (romano.charAt(i) == ALGARISMOS_ROMANOS[j].charAt(0)) {
                    valorEncontrado = true;
                    if (VALORES_DECIMAIS[j] < valorAnterior) {
                        resultado -= VALORES_DECIMAIS[j];
                    } else {
                        resultado += VALORES_DECIMAIS[j];
                        valorAnterior = VALORES_DECIMAIS[j];
                    }
                    break;
                }
            }
            if (!valorEncontrado) {
                resultado = 0;
                break;
            }
        }
        return resultado;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int opcao;
        int decimal;
        String romano;
        do {
            System.out.println("==========================");
            System.out.println(" CONVERSOR DECIMAL-ROMANO ");
            System.out.println("==========================");
            System.out.println();
            System.out.println("1 - Converter decimal para romano");
            System.out.println("2 - Converter romano para decimal");
            System.out.println("0 - Sair");
            System.out.println();
            System.out.print("Digite a opcao desejada: ");
            opcao = scanner.nextInt();
            switch (opcao) {
                case 1:
                    System.out.println();
                    System.out.print("Digite um numero decimal (ate " + LIMITE_MAXIMO_DECIMAL + "): ");
                    decimal = scanner.nextInt();
                    if (decimal < 1 || decimal > LIMITE_MAXIMO_DECIMAL) {
                        System.out.println("Valor decimal fora do limite permitido.");
                    } else {
                        System.out.println("Valor em algarismo romano: " + decimalParaRomano(decimal));
                    }
                    break;
                case 2:
                    System.out.println();
                    System.out.print("Digite um numero romano (ate " + LIMITE_MAXIMO_ROMANO + "): ");
                    romano = scanner.next();
                    romano = romano.toUpperCase();
                    if (romano.length() == 0 || romanoParaDecimal(romano) == 0) {
                        System.out.println("Valor romano fora do limite permitido.");
                    } else {
                        System.out.println("Valor em decimal: " + romanoParaDecimal(romano));
                    }
                    break;
            }
            System.out.println();
        } while (opcao != 0);
    }
}
