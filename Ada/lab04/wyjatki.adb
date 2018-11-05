-- Mateusz Ziomek
-- 4.11.2018

with Ada.Text_IO;
use Ada.Text_IO;

procedure Wyjatki is
   Pl : File_Type;
   Nazwa : String(1..100) := (others => ' ');
   Dlugosc : Integer := 0;
begin
   loop
      Put_Line("Podaj nazwę pliku do otwarcia: ");
      Get_Line(Nazwa, Dlugosc);
   begin
      Open(Pl, In_File, Nazwa(1..Dlugosc));
      exit;
      exception
         when Name_Error => Put_Line("Bledna nazwa pliku <" & Nazwa & ">");
      end;
   end loop;

   Put_Line("Otwieram plik: " & Nazwa(1..Dlugosc));

   while not End_Of_File(Pl) loop
   begin
      Put_Line(Get_Line(Pl));
   exception
      when End_Error =>
         if Is_Open(Pl) then
            Close(Pl);
         end if;
      end;
   end loop;

   Put_Line("Zamykam plik");
   Close(Pl);
end Wyjatki;
