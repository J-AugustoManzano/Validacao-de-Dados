NUMERO = None
NUMERO_AUX = ""

while (True):
  NUMERO_AUX = input("Entre um numero: ")
  try:
    NUMERO = int(NUMERO_AUX)
    break
  except (ValueError):
    print("Entrada invalida. Por favor, tente novamente.")
print("Voce informou o numero:", NUMERO)
