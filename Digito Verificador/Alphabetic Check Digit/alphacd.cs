using System;

namespace AlphabeticCheckDigit
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("ALPHABETIC CHECK DIGIT");
            Console.WriteLine("======================");
            Console.WriteLine();

            Console.Write("Entre matricula alfanumerica (tamanho livre): ");
            string entrada = Console.ReadLine();
            Console.WriteLine("Dígito verificador para " + entrada + " = " + AlphaCD(entrada));
            Console.WriteLine();

            Console.Write("Entre matricula e dígito verificador (juntos): ");
            string matricula = Console.ReadLine();
            char digitoVerificador = matricula[matricula.Length - 1];
            string matriculaSemDigito = matricula.Substring(0, matricula.Length - 1).Trim();

            if (AlphaCD(matriculaSemDigito) == digitoVerificador)
            {
                Console.WriteLine("Numero valido.");
            }
            else
            {
                Console.WriteLine("Numero invalido.");
            }
        }

        public static char AlphaCD(string valor)
        {
            int soma = 0;
            int proximo = 0;
            int[] digitos = new int[valor.Length];

            for (int i = 0; i < valor.Length; i++)
            {
                char caractere = char.ToUpper(valor[i]);
                if (caractere == ' ' || caractere == '.' || caractere == '-')
                {
                    // Ignorar caracteres especiais
                    continue;
                }
                else if (caractere >= '0' && caractere <= '9')
                {
                    digitos[valor.Length - i - 1] = caractere - '0';
                }
                else if (caractere >= 'A' && caractere <= 'Z')
                {
                    digitos[valor.Length - i - 1] = (caractere - 'A' + 1) % 9;
                }

                if ((i + 1) % 2 == 0)
                {
                    digitos[valor.Length - i - 1] *= 2;
                    if (digitos[valor.Length - i - 1] >= 10)
                    {
                        digitos[valor.Length - i - 1] = (digitos[valor.Length - i - 1] / 10) + (digitos[valor.Length - i - 1] % 10);
                    }
                }

                soma += digitos[valor.Length - i - 1];
            }

            if (soma % 10 == 0)
            {
                proximo = soma;
            }
            else
            {
                proximo = ((soma / 10) + 1) * 10;
            }

            return (char)(proximo - soma + '0');
        }
    }
}
