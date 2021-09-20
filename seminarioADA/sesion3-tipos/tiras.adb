with Kernel.Serial_Output; use Kernel.Serial_Output;	

procedure tiras is

-- Tiras de caracteres o strings 

S: String (1..20) := (others => '-');

Estrellas: String (1..200) := (1..200 => '*');
Str1: String (1..8) := "un valor";
Str2: String (3..10);
Str3: String (1..10);

begin
  New_line;
  Put ("Imprimimos las tiras de caracteres"); New_Line;
  Put (Str1); New_Line;

  Str2 := Str1;
  Put (Str2); New_Line;

  Str3 := Estrellas(21..30);
  Put (Str3); New_Line;

  S := "literal + " & Str3;
  Put (S); New_Line;
end;
