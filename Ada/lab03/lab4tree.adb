-- Mateusz Ziomek
-- 28.10.2018

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Lab4Tree is
    type Leaf is record
        Data: Integer := 0;
        Left: access Leaf := Null;
        Right: access Leaf := Null;
    end record;

    type Leaf_Ptr is access all Leaf;

    procedure Print_Leaf(Tree : access Leaf) is
        T : access Leaf := Tree;
    begin
        if T.Left /= Null and T.Right /= Null then
            Put(T.Data'Img & " {L:");
            Print_Leaf(T.Left);
            Put(" R:");
            Print_Leaf(T.Right);
            Put("}");
        elsif T.Left /= Null and T.Right = Null then
            Put(T.Data'Img & " {L:");
            Print_Leaf(T.Left);
            Put(" R: Null}");
        elsif T.Left = Null and T.Right /= Null then
            Put(T.Data'Img & " {L: Null R:");
            Print_Leaf(T.Right);
            Put("}");
        elsif T.Left = Null and T.Right = Null then
            Put(T.Data'Img & " {L: Null R: Null}");
        end if;
    end Print_Leaf;

    procedure Print(Tree : access Leaf) is
    begin
        if Tree = Null then
            Put_Line("Empty Tree!");
        else
            Put_Line("Tree:");
            Print_Leaf(Tree);
        end if;
    end Print;

    procedure Insert(Tree : in out Leaf_Ptr; D : in Integer) is
        T : access Leaf := Tree;
        L : Leaf_Ptr := new Leaf;
        Flag : Boolean := True;
    begin
        L.Data := D;
        L.Left := Null;
        L.Right := Null;

        if Flag and T = Null then
            Tree := L;
            Flag := False;
        end if;

        while Flag loop
            if L.Data < T.Data then
                if T.Left = Null then
                    T.Left := L;
                    Flag := False;
                else
                    T := T.Left;
                end if;
            else
                if T.Right = Null then
                    T.Right := L;
                    Flag := False;
                else
                    T := T.Right;
                end if;
            end if;
        end loop;
    end Insert;

    procedure Random_Insert(Tree : in out Leaf_Ptr; N : in Integer) is
        subtype Numbers is Integer range 0..99;
        package Los_Liczby is new Ada.Numerics.Discrete_Random(Numbers);
        use Los_Liczby;
        Gen: Generator;
    begin
        Put_Line("iksde");
        Reset(Gen);
        for I in 1..N loop
            Insert(Tree, Random(Gen));
        end loop;
    end Random_Insert;

    Drzewo : Leaf_Ptr := Null;
begin
    Print(Drzewo);
    Insert(Drzewo, 50);
    Print(Drzewo);
    Random_Insert(Drzewo, 10);
    Print(Drzewo);
end Lab4Tree;
