{ 
 PRNG .......: Multiply With Carry (MWC)
 Ano ........: Desconhecido
 Autor ......: George Marsaglia
}

program CMWC_RND;

uses
  SysUtils, DateUtils;
  
type
  CmwcRnd = record
    randomValues: array[0..4095] of LongWord;
    carry: LongWord;
    currentIndex: Cardinal;
  end;

function log2ibase(n, acc: Integer): Integer;
begin
  if n = 1 then
    log2ibase := acc
  else
    log2ibase := log2ibase(n shr 1, acc + 1);
end;

function log2i(n: Integer): Integer;
begin
  log2i := log2ibase(n, 0);
end;

function rand32: LongWord;
var
  seed: LongWord = 0;
  result_: LongWord = 0;
  bits, remainingBits: Integer;
begin
  bits := log2i(MAXINT) + 1;
  remainingBits := 32 - bits;
  repeat
    result_ := (result_ shl bits) or ((seed * 1103515245 + 12345) shr (32 - bits));
    remainingBits := remainingBits - bits;
  until remainingBits <= 0;
  rand32 := result_;
end;

procedure initCMWC(var state: CmwcRnd; seed: Cardinal);
var
  i: Integer;
begin
  for i := 0 to 4095 do
  begin
    seed := (seed * 1103515245 + 12345) and $FFFFFFFF;
    state.randomValues[i] := seed;
  end;
  repeat
  begin
    seed := (seed * 1103515245 + 12345) and $FFFFFFFF;
    state.carry := seed;
  end;
  until state.carry < 809430660;
  state.currentIndex := 4095;
end;

function randCMWC(var state: CmwcRnd): LongWord;
var
  t: UInt64;
  x: LongWord;
begin
  state.currentIndex := (state.currentIndex + 1) and 4095;
  t := 18782 * UInt64(state.randomValues[state.currentIndex]) + state.carry;
  state.carry := t shr 32;
  x := t + state.carry;
  if x < state.carry then
  begin
    x := x + 1;
    state.carry := state.carry + 1;
  end;
  state.randomValues[state.currentIndex] := $FFFFFFFE - x;
  randCMWC := state.randomValues[state.currentIndex];
end;

var
  cmwc1, cmwc2: CmwcRnd;
  Xn1, Xn2: Cardinal;
  i: Integer;

begin

  Xn1 := 1234;
  Xn2 := LongWord(DateTimeToUnix(Now));  
  
  initCMWC(cmwc1, Xn1);
  initCMWC(cmwc2, Xn2);

  writeln('GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)');
  writeln('PSEUDORANDOM NUMBER GENERATOR (PRNG)');
  writeln('PADRAO: Multiply With Carry (MWC)');
  writeln('==========================================');
  writeln;
  writeln('    Semente: 1234        Semente: TIME');
  writeln('    -------------        -------------');

  for i := 1 to 10 do
    writeln(randCMWC(cmwc1):17, '        ', randCMWC(cmwc2):13);
    
end.
