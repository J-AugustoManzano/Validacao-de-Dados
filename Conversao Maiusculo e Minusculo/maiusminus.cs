using System;

class Program {
    static void Main(string[] args) {
        Console.Write("Digite um texto .....: ");
        string texto = Console.ReadLine();

        string textoMaiusculo = texto.ToUpper();
        string textoMinusculo = texto.ToLower();

        Console.Write("Texto em maiusculo ..: ");
        Console.WriteLine(textoMaiusculo);

        Console.Write("Texto em minusculo ..: ");
        Console.WriteLine(textoMinusculo);
    }
}
