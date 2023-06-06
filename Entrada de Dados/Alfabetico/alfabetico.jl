function validarCadeiaAlfabetica()
  
  TEXTO = ""
  
  while true
    print("Entre uma cadeia alfabética: ")
    TEXTO = readline()
    TEXTO = strip(TEXTO)
    VALIDACAO = true
    for CARACTERE in TEXTO
      if !(('A' <= CARACTERE <= 'Z') || 
           ('a' <= CARACTERE <= 'z') || 
                  (CARACTERE == ' '))
        VALIDACAO = false
        break
      end
    end
    if (VALIDACAO == false)
      println("Entrada inválida. Por favor, tente novamente.")
    else
      break
    end
  end
  println("Você informou a cadeia: ", TEXTO)
end

validarCadeiaAlfabetica()
