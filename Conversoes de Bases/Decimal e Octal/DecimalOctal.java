import java.util.Scanner;

public class Main { // DecimalOctal
    private static final int LIMITE_MAXIMO_DECIMAL = 2147483647;
    private static final int LIMITE_MAXIMO_OCTAL = 017777777777;
    public static int decimalParaOctal(int decimal) {
        int resto, potencia = 1, octal = 0;
        while (decimal > 0) {
            resto = decimal % 8;
            octal += resto * potencia;
            decimal /= 8;
            potencia *= 10;
        }
        return octal;
    }

    public static int octalParaDecimal(int octal) {
        int potencia = 0, digito, decimal = 0;
        while (octal > 0) {
            digito = octal % 10;
            decimal += digito * Math.pow(8, potencia);
            octal /= 10;
            potencia++;
        }
        return decimal;
    }

    public static boolean isValidOctal(int octal) {
        while (octal > 0) {
            if (octal % 10 > 7) {
                return false;
            }
            octal /= 10;
        }
        return true;
    }

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int opcao = -1;
        int decimal, octal;
        while (opcao != 0) {
            System.out.println("===============================");
            System.out.println(" CONVERSOR DECIMAL-OCTAL       ");
            System.out.println("===============================");
            System.out.println();
            System.out.println("1 - Converter decimal para octal");
            System.out.println("2 - Converter octal para decimal");
            System.out.println("0 - Sair");
            System.out.println();
            System.out.print("Digite a opcao desejada: ");
            opcao = input.nextInt();
            switch (opcao) {
                case 1:
                    System.out.println();
                    System.out.printf("Digite um numero decimal (ate %d): ", LIMITE_MAXIMO_DECIMAL);
                    decimal = input.nextInt();
                    if (decimal > LIMITE_MAXIMO_DECIMAL)
                        System.out.println("Valor decimal fora do limite permitido.");
                    else
                        System.out.println("Valor em octal: " + decimalParaOctal(decimal));
                    break;
                case 2:
                    System.out.println();
                    System.out.printf("Digite um numero octal (ate %d): ", LIMITE_MAXIMO_OCTAL);
                    octal = input.nextInt();
                    if (!isValidOctal(octal))
                        System.out.println("Valor octal invalido.");
                    else if (octal > LIMITE_MAXIMO_OCTAL)
                        System.out.println("Valor octal fora do limite permitido.");
                    else
                        System.out.println("Valor em decimal: " + octalParaDecimal(octal));
                    break;
                case 0:
                    break;
                default:
                    System.out.println("Opcao invalida. Digite novamente.");
            }
            System.out.println();
        }
        input.close();
    }
}
