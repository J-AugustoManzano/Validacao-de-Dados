program ValidarMatricula;

uses
  SysUtils;

function ValidarMatricula(const MATRICULA: string): Boolean;
var
  I: Integer;
begin
  if Length(MATRICULA) <> 9 then
    Exit(False);
  for I := 1 to 3 do
    if not (MATRICULA[I] in ['0'..'9']) then
      Exit(False);
  if MATRICULA[4] <> '.' then
    Exit(False);
  for I := 5 to 7 do
    if not (MATRICULA[I] in ['0'..'9']) then
      Exit(False);
  if MATRICULA[8] <> '-' then
    Exit(False);
  if not (MATRICULA[9] in ['0'..'9']) then
    Exit(False);
  ValidarMatricula := True;
end;

procedure RemoverCaractere(var CADEIA: string; CARACTERE: Char);
var
  POS1, POS2: Integer;
begin
  POS1 := 1;
  POS2 := 1;
  while POS1 <= Length(CADEIA) do
  begin
    if CADEIA[POS1] <> CARACTERE then
    begin
      CADEIA[POS2] := CADEIA[POS1];
      POS2 := POS2 + 1;
    end;
    POS1 := POS1 + 1;
  end;
  SetLength(CADEIA, POS2 - 1);
end;

function Mod11Check(const MATRICULA: string): Boolean;
var
  MATRIC_INT: array[1..7] of Integer;
  I, SOMA: Integer;
begin
  for I := 1 to 7 do
    MATRIC_INT[I] := Ord(MATRICULA[I]) - 48; // ASCII 48 = "0"
  SOMA := 0;
  for I := 1 to 7 do
    SOMA := SOMA + MATRIC_INT[I] * (9 - I);
  Mod11Check := (SOMA mod 11) = 0;
end;

var
  MATRICULA: string;
  DVC: Boolean;
  DVE: Char;

begin
  repeat
    Write('Informe matricula no formato 999.999-9: ');
    ReadLn(MATRICULA);
    if not ValidarMatricula(MATRICULA) then
    begin
      WriteLn;
      WriteLn('Matricula invalida. Tente novamente.');
      WriteLn;
    end;
  until ValidarMatricula(MATRICULA);

  DVC := Mod11Check(MATRICULA);
  DVE := MATRICULA[10];
  WriteLn;
  if (DVC and (DVE = '0')) or (not DVC and (DVE <> '0')) then
    WriteLn('Numero de matricula valido')
  else
    WriteLn('Numero de matricula invalido');
  WriteLn;
  Write('Pressione Enter para encerrar...');
  ReadLn;
end.
