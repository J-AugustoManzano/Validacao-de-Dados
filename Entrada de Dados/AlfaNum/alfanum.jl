function VALIDA_HEXA(VALOR)
  for C in VALOR
    CARACTERE = uppercase(C)
    if (CARACTERE in '0':'9' || 
        CARACTERE in 'A':'F' || 
        CARACTERE in 'a':'f')
      return true
    end
  end
  return false
end

function main()
  println("")
  VALOR_HEX = ""
  SAIR_LOOP = false
  while !SAIR_LOOP
    print("Entre valor hexadecimal de 4 caracteres: ")
    VALOR_HEX = readline()
    VALOR_HEX = strip(VALOR_HEX)
    if length(VALOR_HEX) != 4
      println("Valor inválido, deve ter exatamente 4 caracteres.")
      println()
      continue
    end
    if !VALIDA_HEXA(VALOR_HEX)
      println("Valor inválido, apenas caracteres [0-9], [A-F].")
      println()
      continue
    end
    SAIR_LOOP = true
  end
  VALOR_HEX = uppercase(VALOR_HEX)
  println("Valor fornecido: ", VALOR_HEX)
  println()
end

main()
