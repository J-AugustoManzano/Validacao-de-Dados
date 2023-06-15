class Data:
    def __init__(self):
        self.dia = 0
        self.mes = 0
        self.ano = 0
        self.ok = False

def StrToInt(cadeia):
    if cadeia.isdigit():
        return int(cadeia)
    return 0

def IntToStr(valor):
    return str(valor)

def Formatar(valor, digitos):
    valorCadeia = IntToStr(valor)
    while len(valorCadeia) < digitos:
        valorCadeia = '0' + valorCadeia
    return valorCadeia

def anoBissexto(data):
    if data.ano % 400 == 0:
        return True
    elif data.ano % 4 == 0 and data.ano % 100 != 0:
        return True
    else:
        return False

def ultimoDiaMes(data):
    if data.mes == 2:
        return 29 if anoBissexto(data) else 28
    elif data.mes <= 7:
        return 31 if data.mes % 2 != 0 else 30
    else:
        return 30 if data.mes % 2 != 0 else 31

def validaData(data):
    data.ok = (data.ano >=    1) and (
               data.ano <= 9999) and (
               data.mes >=    1) and (
               data.mes <=   12) and (
               data.dia >=    1) and (
               data.dia <= ultimoDiaMes(data)) and not (
              (data.ano == 1582) and (
               data.mes ==   10) and (
               data.dia >=    5) and (
               data.dia <= 14))


def alteraData(data, dia, mes, ano):
    data.dia = dia
    data.mes = mes
    data.ano = ano
    validaData(data)


def mostraData(data):
    if data.ok:
        print(f"{Formatar(data.dia, 2)}/{Formatar(data.mes, 2)}/{Formatar(data.ano, 4)}")
    else:
        print("**/**/****")


print("TESTE DE VALIDACAO DE DATA (CALENDARIO)")
print("=======================================")
print()

DTS = input("Entre data no formato DD/MM/AAAA: ")

DIA = StrToInt(DTS[0:2])
MES = StrToInt(DTS[3:5])
ANO = StrToInt(DTS[6:10])

data = Data()
alteraData(data, DIA, MES, ANO)

print("Data informada: ", end="")
mostraData(data)

print()
input("Tecle <Enter> para encerrar... ")
