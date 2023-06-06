TEXTO = ""
I = 1
VALIDACAO = false

repeat
  io.write("Entre uma cadeia alfabetica: ")
  TEXTO = io.read()
  TEXTO = string.gsub(TEXTO, "\n", "")
  VALIDACAO = true
  for I = 1, string.len(TEXTO) do
    CARACTERE = string.sub(TEXTO, I, I)
    if not (('A' <= CARACTERE and CARACTERE <= 'Z') or 
            ('a' <= CARACTERE and CARACTERE <= 'z') or 
                    (CARACTERE == ' ')) then
      VALIDACAO = false
      break
    end
  end
  if (VALIDACAO == false) then
    print("Entrada invalida. Por favor, tente novamente.")
  end
until VALIDACAO
print("Voce informou a cadeia: " .. TEXTO)
