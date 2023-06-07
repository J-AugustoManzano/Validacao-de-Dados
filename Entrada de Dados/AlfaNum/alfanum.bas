Dim VALOR_HEX As String

Function VALIDA_HEXA(VALOR As String) As Boolean
  Dim I As Integer
  Dim CARACTERE As String
  For I = 1 To Len(VALOR)
    CARACTERE = UCase(Mid(VALOR, I, 1))
    If Not (CARACTERE >= "0" And CARACTERE <= "9" Or CARACTERE >= "A" And CARACTERE <= "F") Then
      Return False
    End If
  Next I
  Return True
End Function

Print
Do 
  Print "Entre valor hexadecimal de 4 caracteres: ";
  Input "", VALOR_HEX
  If Len(VALOR_HEX) <> 4 Then
    Print "Valor invalido, deve ter exatamente 4 caracteres."
    Print
    Continue Do
  End If
  If Not VALIDA_HEXA(VALOR_HEX) Then
    Print "Valor invalido, apenas caracteres [0-9] e [A-F]."
    Print
    Continue Do
  End If
  Exit Do
Loop While True
VALOR_HEX = UCase(VALOR_HEX)
Print "Valor fornecido: " + VALOR_HEX
Print
