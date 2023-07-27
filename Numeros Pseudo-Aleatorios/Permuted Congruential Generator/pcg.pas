{*
 * PRNG .......: Permuted Congruential Generator (PCG)
 * Ano ........: 2014
 * Autor ......: Dr. M.E. O'Neill
 *}

program PRNG_PCG;

uses
  SysUtils, DateUtils;

function rotr32(x: UInt32; r: Cardinal): UInt32;
begin
  rotr32 := (x shr r) or (x shl ((-r) and 31));
end;

function pcg32(var seed: UInt64): UInt32;
var
  x: UInt64;
  rotation: Cardinal;
begin
  x := seed;
  rotation := Cardinal(x shr 59);
  seed := x * 6364136223846793005 + 1442695040888963407;
  x := x xor (x shr 18);
  seed := seed + x;
  pcg32 := rotr32(UInt32(((x shr 27) + rotation) xor (seed shr 32)), rotation);
end;

function getTimer: UInt32;
var
  currentTime: TDateTime;
begin
  currentTime := Now;
  getTimer := UInt32(SecondsBetween(currentTime, EncodeDate(1970, 1, 1)));
end;

var
  Xn1, Xn2: UInt64;
  i: Integer;
  
begin

  WriteLn('GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)');
  WriteLn('PSEUDORANDOM NUMBER GENERATOR (PRNG)');
  WriteLn('PADRAO: Permuted Congruential Generator (PCG)');
  WriteLn('=============================================');
  WriteLn;

  Xn1 := 1234;
  Xn2 := getTimer;

  WriteLn('      Semente: 1234       Semente: TIME');
  WriteLn('      -------------       -------------');

  for i := 1 to 10 do
  begin
    WriteLn(Format('%19u%20u', [pcg32(Xn1), pcg32(Xn2)]));
  end;
  
end.
