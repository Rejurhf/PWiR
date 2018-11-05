-- menup.adb

with Ada.Text_IO, Opcje, Ada.Calendar;
use Ada.Text_IO, Opcje, Ada.Calendar;

procedure MenuP is
  Zn: Character := ' ';
  Pl: File_Type;
  Name: String := "dziennik.txt";

  procedure Pisz_Menu is
  begin
	New_Line;
	Put_Line("Menu:");
    Put_Line(" s - opcja s");
	Put_Line(" c - opcja c");
	Put_Line(" p - opcja p");
	Put_Line("ESC -Wyjscie");
	Put_Line("Wybierz (s,c,p, ESC-koniec):");
  end Pisz_Menu;

begin
    Create(Pl, Out_File, Name);

    Put_Line(Pl, "Data");
    loop
        Pisz_Menu;
        Get_Immediate(Zn);
        Put_Line(Pl, Zn'Img);
        exit when Zn = ASCII.ESC;
        case Zn is
            when 's' => Opcja_S;
            when 'c' => Opcja_C;
            when 'p' => Opcja_P;
            when others => Put_Line("Blad!!");
        end case;
    end loop;
    Put_Line("Koniec");
    Close(Pl);
end MenuP;
