import math

LimiteMaximoDecimal = 2147483647
LimiteMaximoHexadecimal = '7FFFFFFF'

def DecimalParaHexadecimal(decimal):
    hexadecimal = ""
    while decimal > 0:
        resto = decimal % 16
        if resto <= 9:
            hexadecimal = str(resto) + hexadecimal
        else:
            hexadecimal = chr(resto - 10 + ord('A')) + hexadecimal
        decimal = decimal // 16
    return hexadecimal

def HexadecimalParaDecimal(hexadecimal):
    decimal = 0
    potencia = 0
    while len(hexadecimal) > 0:
        digito = hexadecimal[-1].upper()
        if digito.isdigit():
            decimal += int(digito) * math.pow(16, potencia)
        else:
            decimal += (ord(digito) - ord('A') + 10) * math.pow(16, potencia)
        hexadecimal = hexadecimal[:-1]
        potencia += 1
    return int(decimal)

def IsValidHexadecimal(hexadecimal):
    for digito in hexadecimal:
        if not (digito.isdigit() or digito.upper() in ['A', 'B', 'C', 'D', 'E', 'F']):
            return False
    return True

opcao = -1
while opcao != 0:
    print('===============================')
    print(' CONVERSOR DECIMAL-HEXADECIMAL ')
    print('===============================')
    print()
    print('1 - Converter decimal para hexadecimal')
    print('2 - Converter hexadecimal para decimal')
    print('0 - Sair')
    print()
    opcao = int(input('Digite a opcao desejada: '))
    if opcao == 1:
        print()
        decimal = int(input(f'Digite um numero decimal (ate {LimiteMaximoDecimal}): '))
        if decimal > LimiteMaximoDecimal:
            print('Valor decimal fora do limite permitido.')
        else:
            print(f'Valor em hexadecimal: {DecimalParaHexadecimal(decimal)}')
    elif opcao == 2:
        print()
        hexadecimal = input(f'Digite um numero hexadecimal (ate {LimiteMaximoHexadecimal}): ')
        if not IsValidHexadecimal(hexadecimal):
            print('Valor hexadecimal invalido.')
        elif HexadecimalParaDecimal(hexadecimal) > LimiteMaximoDecimal:
            print('Valor hexadecimal fora do limite permitido.')
        else:
            print(f'Valor em decimal: {HexadecimalParaDecimal(hexadecimal)}')
    print()
