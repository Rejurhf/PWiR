-- Mateusz Ziomek
-- 17.10.18

with Ada.Text_IO, Ada.Numerics.Float_Random, Ada.Calendar, Zad2s;
use Ada.Text_IO, Ada.Numerics.Float_Random, Ada.Calendar, Zad2s;

procedure Zad2b is
    V1: Vector(1..10) := (1|3|5|7 => 1.2, 8..10 => 2.4, others => 7.6);
    V2: Vector(1..5) := (others => 0.0);
    T1, T2: Time;
    D: Duration;

    function Is_Sorted(V: Vector) return Boolean is
        (for all I in V'First..(V'Last-1) => V(I) <= V(I+1));

begin
    T1 := Clock;
    Print(V1);
    FillVector(V2);
    Print(V2);

    Put("Czy tablica posortowana: ");
    Put(Is_Sorted(V1)'Img);
    New_Line;

    Sort(V1);
    Print(V1);
    Put("Czy tablica posortowana: ");
    Put(Is_Sorted(V1)'Img);
    New_Line;

    T2 := Clock;
    D := T2 - T1;
    Put_Line("Czas wykonania programu = " & D'Img & "[s]");

    Save(V1, "test2.txt");
end Zad2b;
