Dim As String texto
Dim As String textoMaiusculo
Dim As String textoMinusculo

Print "Digite um texto .....: ";
Line Input, texto

textoMaiusculo = UCase(texto)
textoMinusculo = LCase(texto)

Print "Texto em maiusculo ...: "; textoMaiusculo
Print "Texto em minusculo ...: "; textoMinusculo
