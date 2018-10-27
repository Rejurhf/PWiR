with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Lab4Lista is
    type Element is
      record
        Data : Integer := 0;
        Next : access Element := Null;
      end record;

    type Elem_Ptr is access all Element;

    procedure Print(List : access Element) is
      L : access Element := List;
    begin
      if List = Null then
        Put_Line("List EMPTY!");
      else
        Put_Line("List:");
      end if;
      while L /= Null loop
        Put(L.Data, 4); -- z pakietu Ada.Integer_Text_IO
        New_Line;
        L := L.Next;
      end loop;
    end Print;

    procedure Insert(List : in out Elem_Ptr; D : in Integer) is
      E : Elem_Ptr := new Element;
    begin
      E.Data := D;
      E.Next := List;
      -- lub E.all := (D, List);
      List := E;
    end Insert;

    -- wstawianie jako funkcja - wersja krótka
    function Insert(List : access Element; D : in Integer) return access Element is
      ( new Element'(D,List) );

    -- do napisania !!
    procedure Insert_Sort(List : in out Elem_Ptr; D : in Integer) is
        L : access Element := List;
        E : Elem_Ptr := new Element;
        Flag : Boolean := True;
    begin
    -- napisz procedurę wstawiającą element zachowując posortowanie (rosnące) listy
        E.Data := D;
        if L = Null then
            E.Next := Null;
            List := E;
            Flag := False;
        elsif L.Data >= E.Data then
            E.Next := L;
            List := E;
            Flag := False;
        end if;

        while flag = True and L /= Null loop
            if L.Next /= Null and then L.Next.Data >= E.Data then
                E.Next := L.Next;
                L.Next := E;
                Flag := False;
            elsif L.Next = Null then
                E.Next := Null;
                L.Next := E;
                Flag := False;
            end if;
            L := L.Next;
        end loop;
    end Insert_Sort;

    procedure Random_Insert(List : in out Elem_Ptr; N : in Integer) is
        subtype Numery is Integer range 0..99;
        package Los_Liczby is new Ada.Numerics.Discrete_Random(Numery);
        use Los_Liczby;
        Gen: Generator;
    begin
        Reset(Gen);
        for I in 1..N loop
            Insert_Sort(List, Random(Gen));
        end loop;
    end Random_Insert;

    function Search(List : Elem_Ptr; V : in Integer) return Boolean is
        L : access Element := List;
    begin
        while L /= Null loop
            if L.Data = V then
                return True;
            end if;
            L := L.Next;
        end loop;
        return False;
    end Search;


    Lista : Elem_Ptr := Null;

    begin
      Print(Lista);
      Lista := Insert(Lista, 21);
      Print(Lista);
      Insert(Lista, 20);
      Print(Lista);
      for I in reverse 1..5 loop
      Insert(Lista, I);
      end loop;
      Print(Lista);

      Insert_Sort(Lista, 14);
      Insert_Sort(Lista, 0);
      Insert_Sort(Lista, 25);
      Insert_Sort(Lista, 18);
      Print(Lista);

      Random_Insert(Lista, 5);
      Print(Lista);

      Put("Is 5? ");
      Put(Search(Lista, 5)'Img);
      New_Line;
      Put("Is 84? ");
      Put(Search(Lista, 84)'Img);
      New_Line;
      Put("Is 108? ");
      Put(Search(Lista, 108)'Img);
      New_Line;
end Lab4Lista;
