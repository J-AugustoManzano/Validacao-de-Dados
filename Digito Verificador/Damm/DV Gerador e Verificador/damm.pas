program ValidarMatricula;

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

function ValidarDamm(const NUMERO: string): Boolean;
var
  DV, I: Integer;
begin
  DV := 0;
  for I := 1 to Length(NUMERO) do
  begin
    DV := dammTab[DV, Ord(NUMERO[I]) - Ord('0')];
  end;
  ValidarDamm := DV = 0;
end;

function RemoverMascara(const NUMERO: string): string;
var
  NUMERO_SMASC: string;
  ENCONTROU_PRIMEIRO_DIGITO: Boolean;
  I: Integer;
begin
  NUMERO_SMASC := '';
  ENCONTROU_PRIMEIRO_DIGITO := False;

  for I := 1 to Length(NUMERO) do
  begin
    if NUMERO[I] = '.' then
    begin
      ENCONTROU_PRIMEIRO_DIGITO := True;
    end
    else if (NUMERO[I] >= '0') and (NUMERO[I] <= '9') then
    begin
      if (not ENCONTROU_PRIMEIRO_DIGITO) and (NUMERO[I] = '0') then
      begin
        continue;
      end;
      NUMERO_SMASC := NUMERO_SMASC + NUMERO[I];
    end;
  end;

  RemoverMascara := NUMERO_SMASC;
end;

var
  entradaValida: Boolean;
  NUMERO: string;
  NUMERO_COM_DV: string;
  NUMERO_SEM_MASCARA_DV: string;
  NUMERO_SMASC: string;
  DV: Integer;

begin
  entradaValida := False;
  repeat
    Write('Entre matricula no formato 999.999: ');
    Readln(NUMERO);
    Writeln;
    if (Length(NUMERO) <> 7) or (NUMERO[4] <> '.') then
    begin
      Writeln;
      Writeln('Matricula invalida. Tente novamente.');
      Writeln;
    end
    else
    begin
      entradaValida := True;
    end;
  until entradaValida;

  NUMERO_SMASC := RemoverMascara(NUMERO);
  DV := GerarDamm(NUMERO_SMASC);
  WriteLn('Digito verificador: ', DV);
  Writeln;

  entradaValida := False;
  repeat
    Write('Entre matricula e digito verificador no formato 999.999-9: ');
    Readln(NUMERO_COM_DV);
    Writeln;
    if (Length(NUMERO_COM_DV) <> 9) or (NUMERO_COM_DV[4] <> '.') or (NUMERO_COM_DV[8] <> '-') then
    begin
      Writeln;
      Writeln('Matricula invalida. Tente novamente.');
      Writeln;
    end
    else
    begin
      entradaValida := True;
    end;
  until entradaValida;

  NUMERO_SEM_MASCARA_DV := RemoverMascara(NUMERO_COM_DV);
  if ValidarDamm(NUMERO_SEM_MASCARA_DV) then
  begin
    WriteLn('Matricula valida.');
  end
  else
  begin
    WriteLn('Matricula invalida.');
  end;
end.
