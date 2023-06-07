Program LeituraHexadecimal;

Uses
  SysUtils;

Var
  VALOR_HEX: String;

Function VALIDA_HEXA(VALOR: String): Boolean;
Var
  I: integer;
  CARACTERE: char;
Begin
  For I := 1 To Length(VALOR) Do
  Begin
    CARACTERE := UpCase(VALOR[I]);
    If Not (CARACTERE In ['0'..'9', 'A'..'F']) Then
      Exit(False);
  End;
  Exit(True);
End;

Begin
  WriteLn;
  Repeat
    Write('Entre valor hexadecimal de 4 caracteres: ');
    ReadLn(VALOR_HEX);
    If (Length(VALOR_HEX) <> 4) Then
    Begin
      WriteLn('Valor invalido, deve ter exatamente 4 caracteres.');
      WriteLn;
      Continue;
    End;
    If Not (VALIDA_HEXA(VALOR_HEX)) Then
    Begin
      WriteLn('Valor invalido, apenas caracteres [0-9] e [A-F].');
      WriteLn;
      Continue;
    End;
    Break;
  Until False;
  VALOR_HEX := UpperCase(VALOR_HEX);
  WriteLn('Valor fornecido: ', VALOR_HEX);
  Writeln;
end.
