def FormataValor(valor):
    # Verifica se o valor possui parte decimal
    if '.' in valor:
        inteiro, decimal = valor.split('.')
    else:
        inteiro = valor
        decimal = '00'
    # Formata a parte inteira
    valorFormatado = ''
    for i in range(len(inteiro), 0, -1):
        valorFormatado = inteiro[i-1] + valorFormatado
        if i > 1 and (len(inteiro) - i + 1) % 3 == 0:
            valorFormatado = '.' + valorFormatado
    valorFormatado = valorFormatado + ',' + decimal
    return valorFormatado

valor = input('Digite um valor real: ')
valorFormatado = FormataValor(valor)
print('Valor formatado:', valorFormatado)
