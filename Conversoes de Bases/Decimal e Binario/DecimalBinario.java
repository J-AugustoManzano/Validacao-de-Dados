import java.util.Scanner;

public class Main { // DecimalBinario

    private static final int LimiteMaximoDecimal = 2147483647;
    private static final String LimiteMaximoBinario = "1111111111111111111111111111111";

    private static String decimalParaBinario(int decimal) {
        StringBuilder binario = new StringBuilder();
        while (decimal > 0) {
            int resto = decimal % 2;
            binario.insert(0, resto);
            decimal /= 2;
        }
        while (binario.length() < 32) {
            binario.insert(0, "0");
        }
        return binario.toString();
    }

    private static int binarioParaDecimal(String binario) {
        int valor = 0;
        for (int i = binario.length() - 1; i >= 0; i--) {
            if (binario.charAt(i) == '1') {
                int potencia = binario.length() - 1 - i;
                valor += 1 << potencia;
            }
        }
        return valor;
    }

    private static boolean isValidBinario(String binario) {
        for (int i = 0; i < binario.length(); i++) {
            if (binario.charAt(i) != '0' && binario.charAt(i) != '1') {
                return false;
            }
        }
        return true;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int opcao = 0;
        int decimal;
        String binario;
        do {
            System.out.println("===========================");
            System.out.println(" CONVERSOR DECIMAL-BINARIO ");
            System.out.println("===========================");
            System.out.println();
            System.out.println("1 - Converter decimal para binario");
            System.out.println("2 - Converter binario para decimal");
            System.out.println("0 - Sair");
            System.out.println();
            System.out.print("Digite a opcao desejada: ");
            opcao = scanner.nextInt();
            switch (opcao) {
                case 1:
                    System.out.println();
                    System.out.print("Digite um numero decimal (ate " + LimiteMaximoDecimal + "): ");
                    decimal = scanner.nextInt();
                    if (decimal > LimiteMaximoDecimal) {
                        System.out.println("Valor decimal fora do limite permitido.");
                    } else {
                        String bin = decimalParaBinario(decimal);
                        System.out.println("Valor em binario: " + bin);
                    }
                    break;
                case 2:
                    System.out.println();
                    System.out.print("Digite um numero binario (ate " + LimiteMaximoBinario + "): ");
                    binario = scanner.next();
                    if (!isValidBinario(binario)) {
                        System.out.println("Valor binario invalido.");
                    } else if (binario.length() > LimiteMaximoBinario.length()) {
                        System.out.println("Valor binario fora do limite permitido.");
                    } else {
                        int dec = binarioParaDecimal(binario);
                        System.out.println("Valor em decimal: " + dec);
                    }
                    break;
                case 0:
                    break;
                default:
                    System.out.println("Opcao invalida. Tente novamente.");
                    break;
            }
            System.out.println();
        } while (opcao != 0);
        scanner.close();
    }
}
