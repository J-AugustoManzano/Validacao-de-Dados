program GeradorMatriculaDV;

{$mode objfpc}{$H+}

uses
  SysUtils;

function FormataMatricula(MATRICULA: Integer): string;
begin
  FormataMatricula := Format('%.6d', [MATRICULA]);
end;

function Mod10(const MATRICULA: string): Integer;
var
  MATRIC_INT: array[1..6] of Integer;
  SOMA: Integer;
  I: Integer;
begin
  for I := 1 to 6 do
    MATRIC_INT[I] := StrToInt(MATRICULA[I]);
  SOMA := 0;
  for I := 1 to 6 do
  begin
    if (I mod 2 = 0) then
    begin
      if MATRIC_INT[I] * 2 > 9 then
        SOMA := SOMA + ((MATRIC_INT[I] * 2) div 10) + ((MATRIC_INT[I] * 2) mod 10)
      else
        SOMA := SOMA + (MATRIC_INT[I] * 2);
    end
    else
      SOMA := SOMA + MATRIC_INT[I];
  end;
  Mod10 := (10 - (SOMA mod 10)) mod 10;
end;

var
  MATRICULA: string;
  I: Integer;
  DV: Integer;
  ARQUIVO: Text;

begin
  Assign(ARQUIVO, 'numeros.txt');
  Rewrite(ARQUIVO);

  Writeln('GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM "DV"');
  Writeln('Padrao: Modulo 10');
  Writeln('---------------------------------------------------------------');
  Writeln;

  if IOResult <> 0 then
  begin
    Writeln('Erro ao abrir o arquivo.');
    Writeln('Programa encerrado.');
    Exit;
  end;

  Write('Aguarde arquivo sendo gerado... ');

  for I := 0 to 999999 do
  begin
    MATRICULA := FormataMatricula(I);
    DV := Mod10(MATRICULA);
    Writeln(ARQUIVO, Copy(MATRICULA, 1, 3) + '.' + Copy(MATRICULA, 4, 3) + '-' + IntToStr(DV));
  end;

  Close(ARQUIVO);

  Writeln;
  Writeln('SUCESSO: Arquivo gerado.');
end.
