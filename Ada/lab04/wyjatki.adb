-- Mateusz Ziomek
-- 4.11.2018

with Ada.Text_IO;vim

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

      --hsjdfskfds
      --sdfjs
      --adsffd
      
