-- Mateusz Ziomek
-- 17.10.18

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Float_Random;
use Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Float_Random;

package body Zad2s is
    Gen: Generator;
    Tmp: Float;
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
end Zad2s;
