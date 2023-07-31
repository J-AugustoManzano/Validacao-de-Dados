{*
 PRNG .......: Tiny Mersenne Twister (TMT)
 Ano ........: 2015 (version 1.1)
 Autor ......: Mutsuo Saito & Makoto Matsumoto
*}

program TinyMersenneTwister;

uses
  SysUtils, DateUtils;

type
  Tinymt32PRNG = record
    status: array[0..3] of Cardinal;
    matrixAlpha: Cardinal;
    matrixBeta: Cardinal;
    tempCoeff: Cardinal;
  end;

procedure tinymt32NextState(var prng: Tinymt32PRNG);
var
  stateX, stateY: Cardinal;
begin
  stateY := prng.status[3];
  stateX := (prng.status[0] and $7fffffff) xor prng.status[1] xor prng.status[2];
  stateX := stateX xor (stateX shl 1);
  stateY := stateY xor ((stateY shr 1) xor stateX);
  prng.status[0] := prng.status[1];
  prng.status[1] := prng.status[2];
  prng.status[2] := stateX xor (stateY shl 10);
  prng.status[3] := stateY;
  if (stateY and 1) <> 0 then
  begin
    prng.status[1] := prng.status[1] xor prng.matrixAlpha;
    prng.status[2] := prng.status[2] xor prng.matrixBeta;
  end;
end;

function tinymt32Temp(const prng: Tinymt32PRNG): Cardinal;
var
  finalValue, tempCalc: Cardinal;
begin
  finalValue := prng.status[3];
  tempCalc := prng.status[0] + (prng.status[2] shr 8);
  finalValue := finalValue xor tempCalc;
  finalValue := finalValue xor (-(Int32(tempCalc and 1)) and prng.tempCoeff);
  tinymt32Temp := finalValue;
end;

procedure tinymt32Init(var prng: Tinymt32PRNG; seed: Cardinal);
var
  i: Cardinal;
begin
  prng.status[0] := seed;
  prng.status[1] := prng.matrixAlpha;
  prng.status[2] := prng.matrixBeta;
  prng.status[3] := prng.tempCoeff;
  for i := 1 to 7 do
  begin
    prng.status[i and 3] :=
      prng.status[i and 3] xor (i + 1812433253 *
      (prng.status[(i - 1) and 3] xor (prng.status[(i - 1) and 3] shr 30)));
  end;
  for i := 0 to 7 do
  begin
    tinymt32NextState(prng);
  end;
end;

function tinymt32Gen(var prng: Tinymt32PRNG): Cardinal;
begin
  tinymt32NextState(prng);
  tinymt32Gen := tinymt32Temp(prng);
end;

var
  Xn1, Xn2: Cardinal;
  seed1, seed2: Tinymt32PRNG;
  i: integer;

begin

  tinymt32Init(seed1, 1234);
  tinymt32Init(seed2, DateTimeToUnix(Now));

  WriteLn('GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)');
  WriteLn('PSEUDORANDOM NUMBER GENERATOR (PRNG)');
  WriteLn('PADRAO: Tiny Mersenne Twister (TMT)');
  WriteLn('=============================================');
  WriteLn;
  WriteLn('      Semente: 1234       Semente: TIME');
  WriteLn('      -------------       -------------');

  for i := 1 to 10 do
  begin
    Xn1 := tinymt32Gen(seed1);
    Xn2 := tinymt32Gen(seed2);
    WriteLn(Xn1:19, Xn2:20);
  end;
  
end.
