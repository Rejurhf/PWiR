-- Rejurhf
-- 15.11.2018

with Ada.Text_IO;
use Ada.Text_IO;

procedure zad0 is
task Klient is
  entry Start;
end Klient;


task Serwer is
  entry Start;
  entry Koniec;
  entry We(I:Integer);
end Serwer;


task body Klient is
begin
  accept Start;
  for K in 1..10 loop
      Put_Line(K'Img);
	  -- Serwer.We(K);
  end loop;
  -- Serwer.Koniec; 
end Klient;


task body Serwer is
  Lok: Integer;
begin
  accept Start;
  loop
    select
     accept We(I: in Integer) do
	     Lok := I;
     end We;
	   Put_Line("Lok=" & Lok'Img);
    or
	 accept Koniec;
 	 exit;
    end select;
  end loop;

  Put_Line("Koniec Serwer ");
end Serwer;

begin
  Serwer.Start;
  for K in 1..10 loop
      Serwer.We(K);
  end loop;
  Klient.Start;
  Serwer.Koniec;
  Put_Line("Koniec_PG ");
end zad0;
