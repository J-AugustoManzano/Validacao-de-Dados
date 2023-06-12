program ValidarMatricula;

uses
  SysUtils;

function ValidarMatricula(const MATRICULA: string): Boolean;
begin
  if Length(MATRICULA) <> 9 then
    Exit(False);
  if not (MATRICULA[1] in ['0'..'9']) or not (MATRICULA[2] in ['0'..'9']) or not (MATRICULA[3] in ['0'..'9']) then
    Exit(False);
  if MATRICULA[4] <> '.' then
    Exit(False);
  if not (MATRICULA[5] in ['0'..'9']) or not (MATRICULA[6] in ['0'..'9']) or not (MATRICULA[7] in ['0'..'9']) then
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

function Mod10Check(const MATRICULA: string): Integer;
var
  MATRIC_INT: array[1..6] of Integer;
  SOMA, I, DV: Integer;
begin
  for I := 1 to 6 do
    MATRIC_INT[I] := StrToIntDef(MATRICULA[I], 0);
  SOMA := 0;
  for I := 1 to 6 do
  begin
    if (I mod 2 = 0) then
    begin
      if MATRIC_INT[I] * 2 > 9 then
        SOMA := SOMA + (MATRIC_INT[I] * 2 - 9)
      else
        SOMA := SOMA + (MATRIC_INT[I] * 2);
    end
    else
      SOMA := SOMA + MATRIC_INT[I];
  end;
  DV := (10 - (SOMA mod 10)) mod 10;
  Mod10Check := DV;
end;

var
  MATRIC_CPT, MATRIC_SPT: string;
  MATRIC_INT: array[1..7] of Integer;
  I, DVC, DVE: Integer;

begin
  repeat
    Write('Informe a matricula no formato 999.999-9: ');
    ReadLn(MATRIC_CPT);
    if not ValidarMatricula(MATRIC_CPT) then
    begin
      WriteLn;
      WriteLn('Entrada invalida, tente novamente.');
      WriteLn; WriteLn;
    end;
  until ValidarMatricula(MATRIC_CPT);

  MATRIC_SPT := MATRIC_CPT;
  RemoverCaractere(MATRIC_SPT, '.');
  RemoverCaractere(MATRIC_SPT, '-');
  DVC := Mod10Check(MATRIC_SPT);

  for I := 1 to 7 do
    MATRIC_INT[I] := StrToIntDef(MATRIC_SPT[I], 0);
  DVE := MATRIC_INT[7];

  WriteLn;
  if DVC = DVE then
    WriteLn('Matricula valida.')
  else
    WriteLn('Matricula invalida.');
  WriteLn;
  
  Write('Pressione <Enter> para encerrar... ');
  ReadLn;
end.
