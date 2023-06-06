Dim As String TEXTO, CARACTERE
Dim As Integer I
Dim As Boolean VALIDACAO

Do
  Print "Entre uma cadeia alfabetica: ";
  Input "", TEXTO
  VALIDACAO = True
  For I = 1 To Len(TEXTO)
    CARACTERE = Mid$(TEXTO, I, 1)
    If Not ((CARACTERE >= "A") And (CARACTERE <= "Z")) And _
       Not ((CARACTERE >= "a") And (CARACTERE <= "z")) And _
       Not  (CARACTERE = " ") Then
      VALIDACAO = False
      Exit For
    End If
  Next I
  If (VALIDACAO = False) Then
    Print "Entrada invalida. Por favor, tente novamente."
  Else
    Exit Do
  End If
Loop While (True)

Print "Voce informou a cadeia: " & TEXTO
