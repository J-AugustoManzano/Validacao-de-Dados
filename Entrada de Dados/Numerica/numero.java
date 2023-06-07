import java.util.Scanner;

class Main {
  public static void main(String[] args) {

    int NUMERO;
    String NUMERO_AUX;

    Scanner entrada = new Scanner(System.in);
    do {
      System.out.print("Entre um numero: ");
      NUMERO_AUX = entrada.nextLine();
      try {
        NUMERO = Integer.parseInt(NUMERO_AUX);
        break;
      } catch (NumberFormatException e) {
        System.out.println("Entrada invalida. Por favor, tente novamente.");
      }
    } while (true);
    entrada.close();
    System.out.println("Voce informou o numero: " + NUMERO);
  }
}
