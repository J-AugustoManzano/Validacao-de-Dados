program GerarMatricula;

uses
  SysUtils;

function ValidarMatricula(const MATRICULA: string): Boolean;
var
  I: Integer;
begin
  ValidarMatricula := False;
  if Length(MATRICULA) <> 7 then
    Exit;
  if not (MATRICULA[1] in ['0'..'9']) or not (MATRICULA[7] in ['0'..'9']) then
    Exit;
  if MATRICULA[4] <> '.' then
    Exit;
  for I := 2 to 3 do
    if not (MATRICULA[I] in ['0'..'9']) or not (MATRICULA[I + 4] in ['0'..'9']) then
      Exit;
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
  MATRIC_CPT: string;
  MATRIC_SPT: string;
  DV: Integer;

begin
  repeat
    Write('Informe matricula no formato 999.999: ');
    ReadLn(MATRIC_CPT);
    if not ValidarMatricula(MATRIC_CPT) then
    begin
      WriteLn;
      WriteLn('Matricula invalida. Tente novamente.');
      WriteLn;
      WriteLn;
    end;
  until ValidarMatricula(MATRIC_CPT);
  
  MATRIC_SPT := MATRIC_CPT;
  RemoverCaractere(MATRIC_SPT, '.');
  DV := Mod10(MATRIC_SPT);
  WriteLn;
  WriteLn('Matricula com DV = ', MATRIC_CPT, '-', DV);
  WriteLn;
  Write('Tecle <Enter> para encerrar... ');
  ReadLn;
end.
