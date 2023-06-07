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

begin
  repeat
    Write('Entre um numero: ');
    ReadLn(NUMERO_AUX);
    if (TryStrToInt(NUMERO_AUX, NUMERO)) then
      break
    else
      WriteLn('Entrada invalida. Por favor, tente novamente.');
  until (False);
  
  WriteLn('Voce informou o numero: ', NUMERO);
end.
