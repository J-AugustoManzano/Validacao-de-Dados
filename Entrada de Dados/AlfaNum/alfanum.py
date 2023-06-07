def VALIDA_HEXA(VALOR):
  for CARACTERE in VALOR:
    if not (CARACTERE.isdigit() or (CARACTERE >= 'A' and CARACTERE <= 'F') or (CARACTERE >= 'a' and CARACTERE <= 'f')):
      return False
  return True

print("")
VALOR_HEX = ""
SAIR_LOOP = False
while not SAIR_LOOP:
  VALOR_HEX = input("Entre valor hexadecimal de 4 caracteres: ").strip()
  if (len(VALOR_HEX) != 4):
    print("Valor invalido, deve ter exatamente 4 caracteres.")
    print()
    continue
  if (not VALIDA_HEXA(VALOR_HEX)):
    print("Valor invalido, apenas caracteres [0-9] e [A-F].")
    print()
    continue
  SAIR_LOOP = True
VALOR_HEX = VALOR_HEX.upper()
print("Valor fornecido: " + VALOR_HEX)
print()
