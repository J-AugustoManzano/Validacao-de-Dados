program VALIDA_NUMERO;

{$IFDEF FPC}
  {$MODE OBJFPC}
{$ELSE}
  {$APPTYPE CONSOLE}
{$ENDIF}

uses
  SysUtils;

var
  NUMERO: Integer;
  NUMERO_AUX: String;
  VALIDACAO: Boolean;

begin
  repeat
    VALIDACAO := False;
    Write('Entre um nUmero: ');
    ReadLn(NUMERO_AUX);
    if TryStrToInt(NUMERO_AUX, NUMERO) then
      VALIDACAO := True
    else
      WriteLn('Entrada invalida. Por favor, tente novamente.');
  until (VALIDACAO = True);
  WriteLn('VocE informou o nUmero: ', NUMERO);
end.
