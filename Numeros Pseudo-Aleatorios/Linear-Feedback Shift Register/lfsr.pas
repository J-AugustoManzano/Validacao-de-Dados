{
 PRNG .......: Linear-Feedback Shift Register (LFSR)
 Ano ........: 1965
 Autor ......: R. C. Tausworthe
}

program LinearFeedbackShiftRegister;

uses
  SysUtils, DateUtils;
  
function lfsr(var state: Cardinal): Double;
begin
  state := (state shr 1) xor ($B4BCD35C * (state and 1));
  lfsr := state / 4294967296.0;
end;

var
  Xn1, Xn2: Cardinal;
  i: Integer;

begin

  Xn1 := $1234; 
  Xn2 := LongWord(DateTimeToUnix(Now)); 

  writeln('GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)');
  writeln('PSEUDORANDOM NUMBER GENERATOR (PRNG)');
  writeln('PADRAO: Linear-Feedback Shift Register');
  writeln('==========================================');
  writeln;
  writeln('    Semente: 1234        Semente: TIME');
  writeln('    -------------        -------------');

  for i := 1 to 10 do
    writeln(lfsr(Xn1):17:11, '        ', lfsr(Xn2):13:11);
    
end.
