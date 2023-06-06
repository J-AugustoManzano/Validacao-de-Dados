TEXTO = ""
VALIDACAO = False

while True:
  TEXTO = input("Entre uma cadeia alfabetica: ")
  VALIDACAO = True
  for CARACTERE in TEXTO:
    if not (('A' <= CARACTERE <= 'Z') or 
            ('a' <= CARACTERE <= 'z') or 
                   (CARACTERE == ' ')):
      VALIDACAO = False
      break
  if  (VALIDACAO == False):
    print("Entrada invalida. Por favor, tente novamente.")
  else:
    break
print("Voce informou a cadeia:", TEXTO)
