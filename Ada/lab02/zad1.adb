-- Mateusz Ziomek
-- 17.10.18

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Float_Random, Ada.Calendar;
use Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Float_Random, Ada.Calendar;

procedure Zad1 is
    Type Vector is array (Integer range <>) of float;
    V1: Vector(1..10) := (1|3|5|7 => 1.2, 8..10 => 2.4, others => 7.6);
    V2: Vector(1..5) := (others => 0.0);
    Gen: Generator;
    Tmp: Float;
    T1, T2: Time;
    D: Duration;
    Pl: File_Type;
    FileName: String := "test.txt";

    procedure Print(V: Vector) is
    begin
        for elem in V'Range loop
            Put("Tab(" & elem'Img & ") = ");
            Put(V(elem),3,4,0);
            New_Line;
        end loop;
        New_Line;
    end Print;

    procedure FillVector(V: out Vector) is
    begin
        Reset(Gen);
        for elem of V loop
            elem := Random(Gen);
        end loop;
    end FillVector;

    procedure Sort(V: out Vector) is
    begin
        for i in V'Range loop
            for j in V'First..(V'Last-i) loop
                if V(j) > V(j+1) then
                    Tmp := V(j);
                    V(j) := V(j+1);
                    V(j+1) := Tmp;
                end if;
            end loop;
        end loop;
    end Sort;

    procedure Save(V: Vector; FileName: String) is
    begin
        Create(Pl, Out_File, FileName);
        Put_Line(Pl, "Wektor: ");
        Put(Pl, "{");
        for i in V'First..V'Last-1 loop
            Put(Pl, V(i),3,4,0);
            Put(Pl, ", ");
        end loop;
        Put(Pl, V(V'Last),3,4,0);
        Put(Pl, "}");
        Close(Pl);
    end Save;


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

    Save(V1, "myk.txt");
end Zad1;
