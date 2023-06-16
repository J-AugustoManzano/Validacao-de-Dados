{*
 * PRNG .......: Mersenne Twister (MT)
 * Ano ........: 1998
 * Autor ......: Makoto Matsumoto & Takuji Nishimura
 *}

program ersenneTwister;

uses
  SysUtils, DateUtils;

const
  w = 32;
  n = 624;
  f = 1812433253;
  m = 397;
  r = 31;
  a = $9908B0DF;
  d = $FFFFFFFF;
  b = $9D2C5680;
  c = $EFC60000;
  u = 11;
  s = 7;
  t = 15;
  l = 18;

type
  MT19937 = record
    X: array[0..n-1] of UInt32;
    cnt: UInt32;
  end;

procedure twist(var rng: MT19937);
var
  i: UInt32;
  lower_mask, upper_mask, tmp, tmpA: UInt32;
begin
  for i := 0 to n-1 do
  begin
    lower_mask := (1 shl r) - 1;
    upper_mask := not lower_mask;
    tmp := (rng.X[i] and upper_mask) + (rng.X[(i + 1) mod n] and lower_mask);
    tmpA := tmp shr 1;
    if (tmp and 1) <> 0 then
      tmpA := tmpA xor a;
    rng.X[i] := rng.X[(i + m) mod n] xor tmpA;
  end;
  rng.cnt := 0;
end;

procedure initialize(var rng: MT19937; seed: UInt32);
var
  i: UInt32;
begin
  rng.X[0] := seed;
  for i := 1 to n-1 do
    rng.X[i] := (f * (rng.X[i - 1] xor (rng.X[i - 1] shr (w - 2))) + i) and d;
  twist(rng);
end;

function temper(var rng: MT19937): UInt32;
var
  y: UInt32;
begin
  if rng.cnt = n then
    twist(rng);
  y := rng.X[rng.cnt];
  y := y xor ((y shr u) and d);
  y := y xor ((y shl s) and b);
  y := y xor ((y shl t) and c);
  y := y xor (y shr l);
  rng.cnt := rng.cnt + 1;
  temper := y;
end;

var
  rng1, rng2: MT19937;
  i: Integer;
  rng1Value, rng2Value: String;

begin

  initialize(rng1, 1234);
  initialize(rng2, UInt32(DateTimeToUnix(Now)));

  WriteLn('GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)');
  WriteLn('PSEUDORANDOM NUMBER GENERATOR (PRNG)');
  WriteLn('PADRAO: Mersenne Twister (MT)');
  WriteLn('==========================================');
  WriteLn;
  WriteLn('    Semente: 1234        Semente: TIME');
  WriteLn('    -------------        -------------');
  WriteLn;

  for i := 1 to 10 do
  begin
    rng1Value := IntToStr(temper(rng1));
    rng2Value := IntToStr(temper(rng2));
    Write('       ');
    Write(Format('%11s', [rng1Value]));
    Write('         ');
    WriteLn(Format('%11s', [rng2Value]));
  end;

end.
