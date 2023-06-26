def AlphaCD(valor):
    soma = 0
    proximo = 0
    digitos = [0] * len(valor)

    for i in range(len(valor)):
        caractere = valor[i].upper()
        if caractere == ' ' or caractere == '.' or caractere == '-':
            continue
        if '0' <= caractere <= '9':
            digitos[len(valor) - i - 1] = ord(caractere) - ord('0')
        elif 'A' <= caractere <= 'Z':
            digitos[len(valor) - i - 1] = (ord(caractere) - ord('A') + 1) % 9

        if (i + 1) % 2 == 0:
            digitos[len(valor) - i - 1] *= 2
            if digitos[len(valor) - i - 1] >= 10:
                digitos[len(valor) - i - 1] = (digitos[len(valor) - i - 1] // 10) + (digitos[len(valor) - i - 1] % 10)

        soma += digitos[len(valor) - i - 1]

    if soma % 10 == 0:
        proximo = soma
    else:
        proximo = ((soma // 10) + 1) * 10

    return chr(proximo - soma + ord('0'))


def TrimString(string):
    i = 0
    while i < len(string) and string[i] == ' ':
        i += 1
    if i < len(string):
        while string[-1] == ' ':
            string = string[:-1]
        return string[i:]
    else:
        return ''


print('ALPHABETIC CHECK DIGIT')
print('======================')
print()

entrada = input('Entre matricula alfanumerica (tamanho livre): ')
print('Dígito verificador para', entrada, '=', AlphaCD(entrada))
print()

matricula = input('Entre matricula e dígito verificador (juntos): ')
digitoVerificador = matricula[-1:]
matricula = TrimString(matricula[:-1])

if AlphaCD(matricula) == digitoVerificador:
    print('Numero valido.')
else:
    print('Numero invalido.')
