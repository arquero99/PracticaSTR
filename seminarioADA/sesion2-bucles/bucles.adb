with Kernel.Serial_Output; use Kernel.Serial_Output;	

procedure bucles is

type Tipo_Vector is array (1..20) of integer;

Mi_Tabla: Tipo_Vector := (2,2,4,1,6,6,7,9,5,6,8,3,3,0,4,8,9,6,4,6);
Otra_Tabla: Tipo_Vector := (5,7,2,5,8,2,4,3,6,5,9,0,5,8,7,6,4,6,7,0);
Tabla_Mayores: Tipo_Vector := (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

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

 for i in Mi_tabla'range loop
 	if Mi_tabla(i)>=Otra_tabla(i) then
		Tabla_Mayores(i):=Mi_Tabla(i);
	else
		Tabla_Mayores(i):=Otra_Tabla(i);
	end if;
 end loop;
 New_line;
 Put ("Ejercicio 1. Tabla con valores más altos: "); 
 New_line;
 Put ("Otra_Tabla: "); 
 for j in 1..20 loop
    Put(integer'Image(Otra_Tabla(j))); Put(" ");
  end loop; 
 New_line;
 Put ("Tabla_Mayores: "); 
 for j in 1..20 loop
    Put(integer'Image(Tabla_Mayores(j))); Put(" ");
  end loop; 
  New_Line;

 
end;
