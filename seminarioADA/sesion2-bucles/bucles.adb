with Kernel.Serial_Output; use Kernel.Serial_Output;	

procedure bucles is

type Tipo_Vector is array (1..20) of integer;

Mi_Tabla: Tipo_Vector := (2,2,4,1,6,6,7,9,5,6,8,3,3,0,4,8,9,6,4,6);

i : integer range 1..20;
suma: integer := 0;

begin
  Put ("Inicio del recorrido del Vector: "); 
  New_line;
 
  for j in 1..20 loop
    Put(integer'Image(Mi_Tabla(j))); Put(" ");
  end loop; 
  New_Line;

  i:=1;
  loop 
    Put(integer'Image(Mi_Tabla(i))); Put(" ");
    exit when Mi_Tabla(i)=0;
    i:=i+1;
  end loop;
  New_line;

  i :=1;
  Put(integer'Image(suma));
  while (suma < 20) loop 
    suma := suma + Mi_Tabla(i);
    Put (" +");
    Put(integer'Image(Mi_Tabla(i))); 
    Put(" =");
    Put(integer'Image(suma));
    i := i + 1;
  end loop;
  New_Line;

 for j in 1..20 loop
    Put(integer'Image(Mi_Tabla(j))); 
    if ((Mi_Tabla(j) rem 2) = 0) then
      Put ("=Par ");
    else 
      Put ("=Impar ");
    end if;
  end loop;
  New_Line;

 
end;
