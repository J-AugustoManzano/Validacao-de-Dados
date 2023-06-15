program dataCalendario;

var
  DTS: string;
  DIA, MES, ANO: Integer;
  data: record
    dia: Integer;
    mes: Integer;
    ano: Integer;
    ok:  Boolean;
  end;
  
function StrToInt(const cadeia: string): Integer;
var
  I, valor, sinal: Integer;
begin
  valor := 0;
  sinal := 1;
  if cadeia = '' then
  begin
    StrToInt := 0;
    Exit;
  end;
  if cadeia[1] = '-' then
  begin
    sinal := -1;
    I := 2;
  end
  else
    I := 1;
  while I <= Length(cadeia) do
  begin
    if not (cadeia[I] in ['0'..'9']) then
    begin
      StrToInt := 0;
      Exit;
    end;
    valor := valor * 10 + Ord(cadeia[I]) - Ord('0');
    Inc(I);
  end;
  StrToInt := valor * sinal;
end;

function IntToStr(valor: Integer): string;
begin
  Str(valor, IntToStr);
end;

function Formatar(valor: Integer; digitos: Integer): string;
var
  valorCadeia: string;
begin
  valorCadeia := IntToStr(valor);
  while Length(valorCadeia) < digitos do
    valorCadeia := '0' + valorCadeia;
  Formatar := valorCadeia;
end;

function anoBissexto: Boolean;
begin
  if data.ano mod 400 = 0 then
    anoBissexto := true
  else if (data.ano mod 4 = 0) and (data.ano mod 100 <> 0) then
    anoBissexto := true
  else
    anoBissexto := false;
end;

function ultimoDiaMes: Integer;
begin
  if data.mes = 2 then
  begin
    if anoBissexto then
      ultimoDiaMes := 29
    else
      ultimoDiaMes := 28;
  end
  else if data.mes <= 7 then
  begin
    if data.mes mod 2 <> 0 then
      ultimoDiaMes := 31
    else
      ultimoDiaMes := 30;
  end
  else
  begin
    if data.mes mod 2 <> 0 then
      ultimoDiaMes := 30
    else
      ultimoDiaMes := 31;
  end;
end;

procedure validaData;
begin
  data.ok := (data.ano >=    1) and 
             (data.ano <= 9999) and
             (data.mes >=    1) and 
             (data.mes <=   12) and
             (data.dia >=    1) and 
             (data.dia <= ultimoDiaMes) and
             not ((data.ano = 1582) and 
                  (data.mes =   10) and 
                  (data.dia >=   5) and 
                  (data.dia <=  14));
end;

procedure alteraData(dia, mes, ano: Integer);
begin
  data.dia := dia;
  data.mes := mes;
  data.ano := ano;
  validaData;
end;

procedure mostraData;
begin
  if data.ok then
    writeln(Formatar(data.dia, 2) + '/' + Formatar(data.mes, 2) + '/' + Formatar(data.ano, 4))
  else
    writeln('**/**/****');
end;

begin
  data.dia := 0;
  data.mes := 0;
  data.ano := 0;
  data.ok := false;
  writeln('TESTE DE VALIDACAO DE DATA (CALENDARIO)');
  writeln('=======================================');
  writeln;
  write('Entre data no formato DD/MM/AAAA: ');
  readln(DTS);

  DIA := StrToInt(Copy(DTS, 1, 2));
  MES := StrToInt(Copy(DTS, 4, 2));
  ANO := StrToInt(Copy(DTS, 7, 4));

  alteraData(DIA, MES, ANO);

  write('Data informada: ');
  mostraData();

  writeln;
  write('Tecle <Enter> para encerrar... ');
  readln;
end.
