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
            Put(T.Data'Img);
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
        New_Line;
    end Print;

    procedure MakeRelations(Tree : access Leaf; Pl : in File_Type) is
        T : access Leaf := Tree;
        Str : String := "";
    begin
        if T.Left /= Null and T.Right /= Null then
            Put_Line(Pl, T.Data'Img & " --" & T.Left.Data'Img);
            MakeRelations(T.Left, Pl);
            Put_Line(Pl, T.Data'Img & " --" & T.Right.Data'Img);
            MakeRelations(T.Right, Pl);
        elsif T.Left /= Null and T.Right = Null then
            Put_Line(Pl, T.Data'Img & " --" & T.Left.Data'Img);
            MakeRelations(T.Left, Pl);
        elsif T.Left = Null and T.Right /= Null then
            Put_Line(Pl, T.Data'Img & " --" & T.Right.Data'Img);
            MakeRelations(T.Right, Pl);
        end if;
    end MakeRelations;

    procedure MakeDOT(Tree : Leaf_Ptr) is
        Pl : File_Type;
        Name: String := "graf.dot";
    begin
        Create(Pl, Out_File, Name);
        Put_Line(Pl, "graph graf {");
        MakeRelations(Tree, Pl);
        Put_Line(Pl, "}");
    end MakeDOT;

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
        subtype Numbers is Integer range 0..50;
        package Los_Liczby is new Ada.Numerics.Discrete_Random(Numbers);
        use Los_Liczby;
        Gen: Generator;
    begin
        Reset(Gen);
        for I in 1..N loop
            Insert(Tree, Random(Gen));
        end loop;
    end Random_Insert;

    function Search(Tree : Leaf_Ptr; V : in Integer) return Boolean is
    begin
        if Tree = Null then
            return False;
        elsif Tree.Data = V then
            return True;
        end if;

        if V < Tree.Data then
            return Search(Tree.Left, V);
        else
            return Search(Tree.Right, V);
        end if;
    end Search;

    function MinValue(Tree: in out Leaf_Ptr) return Integer is
        V : Integer;
    begin
        if Tree.Left = Null then
            V := Tree.Data;
            Tree := Null;
            return V;
        else
            return MinValue(Tree.Left);
        end if;
    end MinValue;

    procedure Delete_Item(Tree : in out Leaf_Ptr; V : in Integer) is
    begin
        if Tree /= Null then
            if Tree.Data = V then
                if Tree.Left = Null and Tree.Right = Null then
                    Tree := Null;
                elsif Tree.Left /= Null and Tree.Right = Null then
                    Tree := Tree.Left;
                elsif Tree.Left = Null and Tree.Right /= Null then
                    Tree := Tree.Right;
                elsif Tree.Left /= Null and Tree.Right /= Null then
                    Tree.Data := MinValue(Tree.Right);
                end if;
                Put_Line("Usunięto element:" & V'Img);
            elsif V < Tree.Data then
                Delete_Item(Tree.Left, V);
            else
                Delete_Item(Tree.Right, V);
            end if;
        end if;
    end Delete_Item;

    function RotateRight(Tree : in out Leaf_Ptr) return Integer is
        T : Leaf_Ptr := new Leaf;
    begin
        if Tree.Left /= Null then
            T := Tree.Left;
            Tree.Left := T.Right;
            T.Right := Tree;
            Tree := T;
            return 1 + RotateRight(Tree);
        elsif Tree.Right /= Null then
            return 1 + RotateRight(Tree.Right);
        end if;
        return 0;
    end RotateRight;

    procedure BalanceBST(Tree : in out Leaf_Ptr) is
        N : Integer := 0;
    begin
        N := RotateRight(Tree);
        Put_Line(N'Img);
    end BalanceBST;

    Drzewo : Leaf_Ptr := Null;
begin
    Print(Drzewo);
    Insert(Drzewo, 25);
    Print(Drzewo);
    Insert(Drzewo, 10);
    Insert(Drzewo, 40);
    Insert(Drzewo, 5);
    Insert(Drzewo, 15);
    Insert(Drzewo, 30);
    Insert(Drzewo, 45);
    Insert(Drzewo, 8);
    Insert(Drzewo, 31);
    Insert(Drzewo, 27);
    Random_Insert(Drzewo, 3);
    Print(Drzewo);

    -- Put_Line("Is 25? " & Search(Drzewo, 25)'Img);
    -- Put_Line("Is 67? " & Search(Drzewo, 67)'Img);
    -- Delete_Item(Drzewo, 25);
    -- Delete_Item(Drzewo, 67);
    -- Put_Line("Is 25? " & Search(Drzewo, 25)'Img);
    -- Put_Line("Is 67? " & Search(Drzewo, 67)'Img);
    -- Print(Drzewo);

    -- BalanceBST(Drzewo);
    -- Print(Drzewo);

    MakeDOT(Drzewo);
end Lab4Tree;
