program Verhoeff;

const
  // Tabela de multiplicacao >>> d(j, k)
  // k = 10 colunas
  // j = 10 linhas
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

  // Tabela de permutacao >>> p(pos, num)
  // num = 10 colunas
  // pos =  8 linhas (mod 8)
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

  // Tabela de inversao >>> inv(j)
  // j = 8 colunas
  //     1 linha
  verhoeffInv: array[0..9] of Integer = (0, 4, 3, 2, 1, 5, 6, 7, 8, 9);

// Gerar digito verificador no padrao Verhoeff
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

// Validar digito verificador no padrao Verhoeff
// Ultimo digito do numero fornecido
function ValidarVerhoeff(const NUMERO: String): Boolean;
var
  DIGITO, POS, NUM, I: Integer;
begin
  DIGITO := 0;
  for I := 1 to Length(NUMERO) do
  begin
    POS := (I - 1) mod 8;
    NUM := Ord(NUMERO[Length(NUMERO) - I + 1]) - 48;
    DIGITO := verhoeffD[DIGITO][verhoeffP[POS][NUM]];
  end;
  ValidarVerhoeff := DIGITO = 0;
end;

// Remove a mascara do numero
function RemoverMascara(const NUMERO: String): String;
var
  NUMERO_SMASC: String;
  ENCONTROU_PRIMEIRO_DIGITO: Boolean;
  CARACTERE: Char;
begin
  NUMERO_SMASC := '';
  ENCONTROU_PRIMEIRO_DIGITO := False;
  for CARACTERE in NUMERO do
  begin
    if CARACTERE = '.' then
      ENCONTROU_PRIMEIRO_DIGITO := True
    else if (Ord(CARACTERE) >= Ord('0')) and (Ord(CARACTERE) <= Ord('9')) then
    begin
      if (not ENCONTROU_PRIMEIRO_DIGITO) and (CARACTERE = '0') then
        Continue;
      NUMERO_SMASC := NUMERO_SMASC + CARACTERE;
    end;
  end;
  RemoverMascara := NUMERO_SMASC;
end;

var
  DV: Integer;
  EntradaValida: Boolean;
  NUMERO, NUMERO_COM_DV, NUMERO_SEM_MASCARA_DV, NUMERO_SMASC: String;

begin
  EntradaValida := False;
  repeat
    Write('Entre matricula no formato 999.999: ');
    Readln(NUMERO);
    WriteLn;
    if (Length(NUMERO) <> 7) or (NUMERO[4] <> '.') then
    begin
      Writeln;
      Writeln('Matricula invalida. Tente novamente.');
      Writeln;
    end
    else
      EntradaValida := True;
  until EntradaValida;

  NUMERO_SMASC := RemoverMascara(NUMERO);
  DV := GerarVerhoeff(NUMERO_SMASC);
  Writeln('Digito verificador: ', DV);
  Writeln;

  EntradaValida := False;
  repeat
    Write('Entre matricula e digito verificador no formato 999.999-9: ');
    Readln(NUMERO_COM_DV);
    WriteLn;
    if (Length(NUMERO_COM_DV) <> 9) or (NUMERO_COM_DV[4] <> '.') or (NUMERO_COM_DV[8] <> '-') then
    begin
      Writeln;
      Writeln('Matricula invalida. Tente novamente.');
      Writeln;
    end
    else
      EntradaValida := True;
  until EntradaValida;

  NUMERO_SEM_MASCARA_DV := RemoverMascara(NUMERO_COM_DV);
  if ValidarVerhoeff(NUMERO_SEM_MASCARA_DV) then
    Writeln('Matricula valida.')
  else
    Writeln('Matricula invalida.');
end.
