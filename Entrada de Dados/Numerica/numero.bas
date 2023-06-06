Dim As Integer NUMERO
Dim As String NUMERO_AUX

Do
  Print "Entre um numero: ";
  Input "", NUMERO_AUX
  If Val(NUMERO_AUX & "0") = 0 Then
    Print "Entrada invalida. Por favor, tente novamente."
  Else
    NUMERO = Val(NUMERO_AUX)
    Exit Do
  End If
Loop While True
Print "Voce informou o numero: " & NUMERO

