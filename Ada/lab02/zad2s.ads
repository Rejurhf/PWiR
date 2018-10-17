-- Mateusz Ziomek
-- 17.10.18

package Zad2s is
    Type Vector is array (Integer range <>) of float;
    
    procedure Print(V: Vector);
    procedure FillVector(V: out Vector);
    procedure Sort(V: out Vector);
    procedure Save(V: Vector; FileName: String);
end Zad2s;
