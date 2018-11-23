with Ada.Text_IO;
use Ada.Text_IO;

procedure zad1 is
  type TBuf is array (Integer range<>) of Character;
-- obiekt chroniony

protected type Buf (N : Integer) is
  entry Wstaw(C : Character);
  entry Pobierz(C : out Character);
  private
    B : TBuf(1..N);
    LiczElem  :Integer := 0;
    PozPob   :Integer := 1;
    PozWstaw :Integer := 1;
end Buf;

protected body Buf is
  entry Wstaw(C : Character) when LiczElem < N is
  begin
    B(PozWstaw) := C;
    LiczElem := LiczElem + 1;
    if PozWstaw = N then
        PozWstaw := 1;
    else
        PozWstaw := PozWstaw + 1;
    end if;
  end Wstaw;
  entry Pobierz(C : out Character) when LiczElem > 0 is
  begin
    C := B(PozPob);
    LiczElem := LiczElem - 1;
    if PozPob = N then
        PozPob := 1;
    else
        PozPob := PozPob + 1;
    end if;
  end Pobierz;
end Buf;

Buff : Buf(5);


task type Producent(C : Character := 'x');

task body Producent is
begin
  Put_Line("$ wstawiam: znak = '" & C & "'");
  Buff.Wstaw(C);
  Put_Line("$ wstawiłem...");
end Producent;


task type Konsument;

task body Konsument is
  Cl : Character := ' ';
begin
  Put_Line("# pobiorę...");
  Buff.Pobierz(Cl);
  Put_Line("# pobrałem: znak = '" & Cl & "'");
end Konsument;


P1 : Producent('a');
P2 : Producent('b');
P3 : Producent('c');
P4 : Producent('d');
P5 : Producent('e');
P6 : Producent('f');
P7 : Producent('g');
P8 : Producent('h');
P9 : Producent('i');
P10 : Producent('j');

K1 : Konsument;
K2 : Konsument;
K3 : Konsument;
begin
  Put_Line("@ jestem w procedurze glownej");
end zad1;
