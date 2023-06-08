import math

LimiteMaximoDecimal = 2147483647
LimiteMaximoOctal = 17777777777

def decimal_para_octal(decimal):
    octal = 0
    potencia = 1
    while decimal > 0:
        resto = decimal % 8
        octal += resto * potencia
        decimal //= 8
        potencia *= 10
    return octal

def octal_para_decimal(octal):
    potencia = 0
    decimal = 0
    while octal > 0:
        digito = octal % 10
        decimal += digito * int(math.pow(8, potencia))
        octal //= 10
        potencia += 1
    return decimal

def is_valid_octal(octal):
    while octal > 0:
        if octal % 10 > 7:
            return False
        octal //= 10
    return True

opcao = -1
while opcao != 0:
    print('=========================')
    print(' CONVERSOR DECIMAL-OCTAL ')
    print('=========================')
    print()
    print('1 - Converter decimal para octal')
    print('2 - Converter octal para decimal')
    print('0 - Sair')
    print()
    opcao = int(input('Digite a opcao desejada: '))
    if opcao == 1:
        print()
        decimal = int(input(f'Digite um numero decimal (ate {LimiteMaximoDecimal}): '))
        if decimal > LimiteMaximoDecimal:
            print('Valor decimal fora do limite permitido.')
        else:
            print(f'Valor em octal: {decimal_para_octal(decimal)}')
    elif opcao == 2:
        print()
        octal = int(input(f'Digite um numero octal (ate {LimiteMaximoOctal}): '))
        if not is_valid_octal(octal):
            print('Valor octal invalido.')
        elif octal > LimiteMaximoOctal:
            print('Valor octal fora do limite permitido.')
        else:
            print(f'Valor em decimal: {octal_para_decimal(octal)}')
    print()
