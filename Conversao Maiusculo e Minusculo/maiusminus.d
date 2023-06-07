import std.stdio;
import std.string;

void main()
{
    write("Digite um texto .....: ");
    string texto = readln();

    string textoMaiusculo = texto.toUpper();
    string textoMinusculo = texto.toLower();

    write("Texto em maiusculo ..: ");
    write(textoMaiusculo);

    write("Texto em minusculo ..: ");
    write(textoMinusculo);
}
