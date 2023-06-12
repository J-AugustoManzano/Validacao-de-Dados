def formata_matricula(matricula):
    return f"{matricula:06d}"

def mod10(matricula):
    soma = 0
    for i in range(6):
        digito = int(matricula[i])
        if i % 2 != 0 and digito * 2 > 9:
            soma += digito * 2 - 9
        elif i % 2 != 0 and digito * 2 <= 9:
            soma += digito * 2
        else:
            soma += digito
    dv = soma % 10
    if dv != 0:
        dv = 10 - dv
    return dv

def main():
    try:
        arquivo = open("numeros.txt", "w")

        print("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"")
        print("Padrao: Modulo 10")
        print("---------------------------------------------------------------")
        print()
        print("Aguarde arquivo sendo gerado... ", end="", flush=True)

        for i in range(1000000):
            matricula = formata_matricula(i)
            dv = mod10(matricula)
            arquivo.write(f"{matricula[:3]}.{matricula[3:]}-{dv}\n")

        arquivo.close()

        print("\n\nSUCESSO: Arquivo gerado.\n")

    except IOError:
        print("Erro ao abrir o arquivo.")
        print("Programa encerrado.")

if __name__ == "__main__":
    main()
