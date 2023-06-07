NUMERO = None
while (True):
  try:
    NUMERO = int(input("Entre um numero: "))
    break
  except (ValueError):
    print("Entrada invalida. Por favor, tente novamente.")
print("Voce informou o numero:", NUMERO)
