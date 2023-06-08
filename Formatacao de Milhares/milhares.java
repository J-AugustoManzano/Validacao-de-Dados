import java.util.Scanner;

public class Main { // SeparacaoMilhares

    public static void formataValor(String valor, StringBuilder valorFormatado) {
        String inteiro, decimal;
        int i;
        // Verifica se o valor possui parte decimal
        if (valor.contains(".")) {
            inteiro = valor.substring(0, valor.indexOf("."));
            decimal = valor.substring(valor.indexOf(".") + 1);
        } else {
            inteiro = valor;
            decimal = "00";
        }
        // Formata a parte inteira
        valorFormatado.setLength(0);
        int count = 0;
        for (i = inteiro.length() - 1; i >= 0; i--) {
            valorFormatado.insert(0, inteiro.charAt(i));
            count++;
            if (count % 3 == 0 && i > 0) {
                valorFormatado.insert(0, ".");
            }
        }
        // Concatena a parte decimal
        valorFormatado.append(",").append(decimal);
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Digite um valor real: ");
        String valor = scanner.nextLine();
        StringBuilder valorFormatado = new StringBuilder();
        formataValor(valor, valorFormatado);
        System.out.println("Valor formatado: " + valorFormatado.toString());
        scanner.close();
    }
}
