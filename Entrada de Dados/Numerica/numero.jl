function main()

  NUMERO = 0
  NUMERO_AUX = ""

  while true
    print("Entre um numero: ")
    NUMERO_AUX = readline()
    if tryparse(Int, NUMERO_AUX) !== nothing
      NUMERO = parse(Int, NUMERO_AUX)
      break
    else
      println("Entrada invalida. Por favor, tente novamente.")
    end
  end
  println("Voce informou o numero: ", NUMERO)
end

main()
