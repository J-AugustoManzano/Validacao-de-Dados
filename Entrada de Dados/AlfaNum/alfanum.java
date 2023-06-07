import java.util.Scanner;

public class Main {
  public static boolean VALIDA_HEXA(String VALOR) {
    for (char c : VALOR.toCharArray()) {
      char CARACTERE = Character.toUpperCase(c);
      if (!(Character.isDigit(CARACTERE) || (CARACTERE >= 'A' && CARACTERE <= 'F'))) {
        return false;
      }
    }
    return true;
  }

  public static void main(String[] args) {
    Scanner entrada = new Scanner(System.in);
    System.out.println();
    String VALOR_HEX = "";
    boolean SAIR_LOOP = false;
    do {
      System.out.print("Entre valor hexadecimal de 4 caracteres: ");
      VALOR_HEX = entrada.nextLine();
      if (VALOR_HEX.length() != 4) {
        System.out.println("Valor invalido, deve ter exatamente 4 caracteres.\n");
      } else if (!VALIDA_HEXA(VALOR_HEX)) {
        System.out.println("Valor invalido, apenas caracteres [0-9] e [A-F].\n");
      } else {
        SAIR_LOOP = true;
      }
    } while (!SAIR_LOOP);
    entrada.close();
    VALOR_HEX = VALOR_HEX.toUpperCase();
    System.out.println("Valor fornecido: " + VALOR_HEX + "\n");
  }
}
