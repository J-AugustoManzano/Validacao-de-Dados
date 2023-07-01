/**
 * PRNG .......: Linear-Feedback Shift Register (LFSR)
 * Ano ........: 1965
 * Autor ......: R. C. Tausworthe
 */

void main() {

  List<int> lfsr(List<int> state) {
    state[0] = (state[0] >> 1) ^ (0xB4BCD35C * (state[0] & 1));
    return [state[0], 4294967296];
  }

  List<int> Xn1 = [0x1234];
  List<int> Xn2 = [(new DateTime.now().millisecondsSinceEpoch & 0xFFFFFFFF)];
  int i = 1;

  print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
  print("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
  print("PADRAO: Linear-Feedback Shift Register");
  print("==========================================\n");
  print("    Semente: 1234        Semente: TIME");
  print("    -------------        -------------\n");

  for (i = 1; i <= 10; i++) {
    List<int> result1 = lfsr(Xn1);
    List<int> result2 = lfsr(Xn2);
    double lfsrXn1 = result1[0] / result1[1];
    double lfsrXn2 = result2[0] / result2[1];
    print("${lfsrXn1.toStringAsFixed(11).padLeft(17)}        ${lfsrXn2.toStringAsFixed(11).padLeft(13)}");
  }

}
