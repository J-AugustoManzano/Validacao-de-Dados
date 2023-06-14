program GeradorMatriculaDV;

{$mode objfpc}{$H+}

uses
  SysUtils;

const
  verhoeffD: array[0..9, 0..9] of Integer = (
    (0, 1, 2, 3, 4, 5, 6, 7, 8, 9),
    (1, 2, 3, 4, 0, 6, 7, 8, 9, 5),
    (2, 3, 4, 0, 1, 7, 8, 9, 5, 6),
    (3, 4, 0, 1, 2, 8, 9, 5, 6, 7),
    (4, 0, 1, 2, 3, 9, 5, 6, 7, 8),
    (5, 9, 8, 7, 6, 0, 4, 3, 2, 1),
    (6, 5, 9, 8, 7, 1, 0, 4, 3, 2),
    (7, 6, 5, 9, 8, 2, 1, 0, 4, 3),
    (8, 7, 6, 5, 9, 3, 2, 1, 0, 4),
    (9, 8, 7, 6, 5, 4, 3, 2, 1, 0)
  );

  verhoeffP: array[0..7, 0..9] of Integer = (
    (0, 1, 2, 3, 4, 5, 6, 7, 8, 9),
    (1, 5, 7, 6, 2, 8, 3, 0, 9, 4),
    (5, 8, 0, 3, 7, 9, 6, 1, 4, 2),
    (8, 9, 1, 6, 0, 4, 3, 5, 2, 7),
    (9, 4, 5, 3, 1, 2, 6, 8, 7, 0),
    (4, 2, 8, 6, 5, 7, 3, 9, 0, 1),
    (2, 7, 9, 3, 8, 0, 6, 4, 1, 5),
    (7, 0, 4, 6, 9, 1, 3, 2, 5, 8)
  );

  verhoeffInv: array[0..9] of Integer = (0, 4, 3, 2, 1, 5, 6, 7, 8, 9);

function GerarVerhoeff(const NUMERO: String): Integer;
var
  DIGITO, POS, NUM, I: Integer;
begin
  DIGITO := 0;
  for I := 1 to Length(NUMERO) do
  begin
    POS := I mod 8;
    NUM := Ord(NUMERO[Length(NUMERO) - I + 1]) - 48; // ASCII 48 = '0'
    DIGITO := verhoeffD[DIGITO][verhoeffP[POS][NUM]];
  end;
  GerarVerhoeff := verhoeffInv[DIGITO];
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
  Writeln('Padrao: Verhoeff');
  Writeln('---------------------------------------------------------------');
  Writeln;

  if IOResult <> 0 then
  begin
    Writeln('Erro ao abrir o ARQUIVO.');
    Writeln('Programa encerrado.');
    Exit;
  end;

  Write('Aguarde ARQUIVO sendo gerado... ');

  for I := 0 to 999999 do
  begin
    MATRICULA := FormataMatricula(I);
    DV := GerarVerhoeff(MATRICULA);
    Writeln(ARQUIVO, Copy(MATRICULA, 1, 3) + '.' + Copy(MATRICULA, 4, 3) + '-' + IntToStr(DV));
  end;

  Close(ARQUIVO);

  Writeln;
  Writeln('SUCESSO: Arquivo gerado.');
end.
