
with Kernel.Serial_Output; use Kernel.Serial_Output;

procedure lanzatareas is

type Vector is array (1..50) of integer;

--   pragma Priority (System.Priority'First);

--Declaraciones

procedure printVector ();


Suma : Integer;
Maximo : Integer;

task A;
task B;
task Ordena;
task SumaElementos;
task getMaximo;


-----------------
--Tareas Implementadas
------------------

task body Ordena is
	Temp : Integer;
begin
	for I in reverse Vector'Range loop
	for J in Vector'First .. I loop
		if A(I) < A(J) then
			Temp := Vector(J);
			Vector(J) := Vector(I);
			Vector(I) := Temp;
		end if;
	end loop;
	end loop;
end Ordena;



task body SumaElementos is
begin
	Suma:=0;
	for I in Vector'Range loop
		Suma:=Suma + Vector(I);
	end loop;
end SumaElementos;



task body getMaximo is
	Temp:Integer:=0;
	for I in Vector'Range loop
		if Vector(I)>Temp then
			Temp:=Vector(I)
		end if
	end loop
	Maximo:=Temp;
end getMaximo;
			

-----------------
--Tareas suministradas
-----------------



task body A is 
begin
  Put_Line ("AAAA"); 
  delay (0.0);
  Put_Line ("AAAA"); 
end A;

task body B is
begin
  Put_Line ("BBBB"); 
  delay (0.0);
  Put_line ("BBBB"); 

end B;

begin
   Put_Line ("hola");
   delay (0.0);
   Put_Line ("adios");

end lanzatareas;


--------------
--Procedimiento implementado
--------------

procedure printVector() is
	New_Line;
	Put ("Vector: ")
	for I in Vector'Range loop
		Put(Integer'Image(Vector(I)));
		if I<Vector'Last then 
		Put(", ");
		end if;
	New_Line;
	end loop;
end printVector;
