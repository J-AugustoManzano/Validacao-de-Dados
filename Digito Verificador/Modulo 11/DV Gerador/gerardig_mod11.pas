program ValidarMatricula;

uses
  SysUtils;

function ValidarMatricula(const MATRICULA: string): Boolean;
var
  I: Integer;
begin
  ValidarMatricula := False;
  if Length(MATRICULA) <> 7 then
    Exit(False);
  if not (MATRICULA[1] in ['0'..'9']) or not (MATRICULA[7] in ['0'..'9']) then
    Exit(False);
  if MATRICULA[4] <> '.' then
    Exit(False);
  for I := 2 to 3 do
    if not (MATRICULA[I] in ['0'..'9']) or not (MATRICULA[I + 4] in ['0'..'9']) then
      Exit(False);
  ValidarMatricula := True;
end;

procedure RemoverCaractere(var CADEIA: string; CARACTERE: Char);
var
  I, J: Integer;
begin
  J := 1;
  for I := 1 to Length(CADEIA) do
  begin
    if CADEIA[I] <> CARACTERE then
    begin
      CADEIA[J] := CADEIA[I];
      J := J + 1;
    end;
  end;
  SetLength(CADEIA, J - 1);
end;

function Mod11(const MATRIC_CPT: string): Char;
var
  MATRIC_SPT: string;
  MATRIC_INT: array[1..6] of Integer;
  I, SOMA: Integer;
begin
  MATRIC_SPT := MATRIC_CPT;
  RemoverCaractere(MATRIC_SPT, '.');
  for I := 1 to 6 do
    MATRIC_INT[I] := Ord(MATRIC_SPT[I]) - 48;
  SOMA := 0;
  for I := 1 to 6 do
    SOMA := SOMA + MATRIC_INT[I] * (8 - I);
  if (SOMA mod 11) = 0 then
    Mod11 := '0'
  else if (SOMA mod 11) = 1 then
    Mod11 := 'X'
  else if (SOMA mod 11) = 10 then
    Mod11 := '1'
  else if (11 - (SOMA mod 11)) in [2..9] then
    Mod11 := Chr((11 - (SOMA mod 11)) + 48);
end;

var
  MATRICULA, DV: string;

begin

  repeat
    Write('Informe matricula no formato 999.999: ');
    Readln(MATRICULA);
    if not ValidarMatricula(MATRICULA) then
    begin
      Writeln;
      Writeln('Matricula invalida. Tente novamente.');
      Writeln;
    end;
  until ValidarMatricula(MATRICULA);

  DV := Mod11(MATRICULA);
  Writeln;
  Writeln('Matricula com DV = ', MATRICULA, '-', DV);
  Writeln;
  Writeln('Pressione <Enter> para encerrar...');
  Readln;
end.
