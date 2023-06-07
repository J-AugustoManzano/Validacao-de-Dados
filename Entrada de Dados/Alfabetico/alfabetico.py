TEXTO = ""
VALIDACAO = False
CARACTERE = ''

while True:
  TEXTO = input("Entre uma cadeia alfabetica: ")
  VALIDACAO = False
  for CARACTERE in TEXTO:
    if  (('A' <= CARACTERE <= 'Z') or 
         ('a' <= CARACTERE <= 'z') or 
                (CARACTERE == ' ')):
      VALIDACAO = True
      break
  if  (VALIDACAO == False):
    print("Entrada invalida. Por favor, tente novamente.")
  else:
    break
print("Voce informou a cadeia:", TEXTO)
