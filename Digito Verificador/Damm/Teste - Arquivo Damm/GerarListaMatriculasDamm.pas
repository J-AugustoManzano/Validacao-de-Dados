program GeradorMatriculaDV;

{$mode objfpc}{$H+}

uses
  SysUtils;

const
  dammTab: array[0..9, 0..9] of Integer = (
    (0, 3, 1, 7, 5, 9, 8, 6, 4, 2),
    (7, 0, 9, 2, 1, 5, 4, 8, 6, 3),
    (4, 2, 0, 6, 8, 7, 1, 3, 5, 9),
    (1, 7, 5, 0, 9, 8, 3, 4, 2, 6),
    (6, 1, 2, 3, 0, 4, 5, 9, 7, 8),
    (3, 6, 7, 4, 2, 0, 9, 5, 8, 1),
    (5, 8, 6, 9, 7, 2, 0, 1, 3, 4),
    (8, 9, 4, 5, 3, 6, 2, 0, 1, 7),
    (9, 4, 3, 8, 6, 1, 7, 2, 0, 5),
    (2, 5, 8, 1, 4, 3, 6, 7, 9, 0)
  );

function GerarDamm(const NUMERO: string): Integer;
var
  DV, I: Integer;
begin
  DV := 0;
  for I := 1 to Length(NUMERO) do
  begin
    DV := dammTab[DV, Ord(NUMERO[I]) - Ord('0')];
  end;
  GerarDamm := DV;
end;

function FormataMatricula(MATRICULA: Integer): string;
begin
  FormataMatricula := Format('%.6d', [MATRICULA]);
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
  Writeln('Padrao: Damm');
  Writeln('---------------------------------------------------------------');
  Writeln;

  if IOResult <> 0 then
  begin
    Writeln('Erro ao abrir o ARQUIVO.');
    Writeln('Programa encerrado.');
    Exit;
  end;

  Writeln('Aguarde ARQUIVO sendo gerado... ');

  for I := 0 to 999999 do
  begin
    MATRICULA := FormataMatricula(I);
    DV := GerarDamm(MATRICULA);
    Writeln(ARQUIVO, Copy(MATRICULA, 1, 3) + '.' + Copy(MATRICULA, 4, 3) + '-' + IntToStr(DV));
  end;

  Close(ARQUIVO);

  Writeln;
  Writeln('SUCESSO: Arquivo gerado.');
end.
