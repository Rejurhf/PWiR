-- Rejurhf
-- 19.11.2018

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Elementary_Functions, Ada.Numerics.Discrete_Random;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Elementary_Functions;

procedure hello is
task Points is
  entry Generate(N:Integer);
end Points;


task Counter is
    entry Start;
    entry Dist(X:Integer; Y:Integer);
    entry Stop;
end Counter;


task body Points is
    subtype Numery is Integer range -99..99;
    package Los_Liczby is new Ada.Numerics.Discrete_Random(Numery);
    use Los_Liczby;
    Gen: Generator;
    X, Y:Integer;
    V:Integer;
begin
    accept Generate(N: in Integer) do
        V := N;
    end Generate;
    Reset(Gen);
    for I in 1..V loop
        X := Random(Gen);
        Y := Random(Gen);
        Counter.Dist(X, Y);
    end loop;
    Put_Line("End Points");
    Counter.Stop;
end Points;


task body Counter is
    X1, Y1:Integer := 0;
    X2, Y2:Integer;
    D:Float;
    A, B: Float;
begin
  accept Start;
  loop
    select
    accept Dist(X:Integer; Y:Integer) do
        X2 := X;
        Y2 := Y;
    end Dist;
        Put_Line("(X,Y) = (" & X2'Img & "," & Y2'Img & ")");
        A := Float(X2 - 0);
        B := Float(Y2 - 0);
        D := Sqrt((A*A)+(B*B));
        Put_Line("Distance from (0,0) = " & D'Img);
        A := Float(X2 - X1);
        B := Float(Y2 - Y1);
        D := Sqrt((A*A)+(B*B));
        Put_Line("Distance from (" & X1'Img & "," & Y1'Img & ") = " & D'Img);
        X1 := X2;
        Y1 := Y2;
    or
    accept Stop;
        exit;
    end select;
    end loop;
    Put_Line("End Counter");
end Counter;

begin
    Counter.Start;
    Points.Generate(5);
    Put_Line("End PG ");
end hello;
