program GeradorMatriculaDV;

{$mode objfpc}{$H+}

uses
  SysUtils;

procedure removerCaractere(var CADEIA: AnsiString; CARACTERE: Char);
var
  POS1, POS2: PChar;
begin
  POS1 := PChar(CADEIA);
  POS2 := PChar(CADEIA);
  while POS1^ <> #0 do
  begin
    POS2^ := POS1^;
    Inc(POS1);
    if POS2^ <> CARACTERE then
      Inc(POS2);
  end;
  POS2^ := #0;
end;

function mod11(const MATRIC_CPT: string): Char;
var
  MATRIC_SPT: string;
  MATRIC_INT: array[1..6] of Integer;
  I, SOMA: Integer;
  DV: Char;
begin
  MATRIC_SPT := MATRIC_CPT;
  removerCaractere(MATRIC_SPT, '.');
  for I := 1 to 6 do
    MATRIC_INT[I] := Ord(MATRIC_SPT[I]) - 48;
  SOMA := 0;
  for I := 1 to 6 do
    SOMA := SOMA + MATRIC_INT[I] * (8 - I);
  if (SOMA mod 11) = 0 then
    DV := '0'
  else if (SOMA mod 11) = 1 then
    DV := 'X'
  else if (SOMA mod 11) = 10 then
    DV := '1'
  else
    DV := Chr(11 - (SOMA mod 11) + Ord('0'));
  mod11 := DV;
end;

function FormataMatricula(MATRICULA: Integer): string;
begin
  Result := Format('%.6d', [MATRICULA]);
end;

var
  MATRICULA, MATRICULA_TEMP: string;
  I: Integer;
  ARQUIVO: Text;

begin
  Assign(ARQUIVO, 'numeros.txt');
  Rewrite(ARQUIVO);

  Writeln('GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM "DV"');
  Writeln('Padrao: Modulo 11');
  Writeln('---------------------------------------------------------------');
  Writeln;

  if IOResult <> 0 then
  begin
    Writeln('Erro ao abrir o arquivo.');
    Writeln('Programa encerrado.');
    Exit;
  end;

  WriteLn('Aguarde arquivo sendo gerado... ');

  for I := 0 to 999999 do
  begin
    MATRICULA := FormataMatricula(I);
    MATRICULA_TEMP := MATRICULA;
    MATRICULA := Copy(MATRICULA_TEMP, 1, 3) + '.' + Copy(MATRICULA_TEMP, 4, 3) + '-' + mod11(MATRICULA_TEMP);
    Writeln(ARQUIVO, MATRICULA);
  end;

  Close(ARQUIVO);

  Writeln;
  Writeln('SUCESSO: Arquivo gerado.');
end.
