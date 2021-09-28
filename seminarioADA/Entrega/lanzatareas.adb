
with Kernel.Serial_Output; use Kernel.Serial_Output;

procedure lanzatareas is

type Vector is array (1..50) of integer;

--   pragma Priority (System.Priority'First);


--Declaraciones

procedure printVector (vec : in Vector);

vec : Vector:=(1=>10 ,3=>17 ,4=>154 ,10=>40 ,15=>8 ,20=>21 ,26=>15 ,30=>27 ,33=>88 ,41=>11 ,48=>66, others => 0 );

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
	Put_Line ("Comienzo ejecución tarea Ordena. Vector sin ordenar:");
	printVector(vec); 
	for I in reverse Vector'Range loop
	for J in Vector'First .. I loop
		if vec(I) < vec(J) then
			Temp := vec(J);
			vec(J) := vec(I);
			vec(I) := Temp;
		end if;
	end loop;
	end loop;
	Put_Line ("Vector ordenado:");
	printVector(vec); 
end Ordena;



task body SumaElementos is
begin
	Put_Line ("Comienzo ejecución tarea Suma"); 
	Suma:=0;
	for I in vec'Range loop
		Suma:= Suma + vec(I);
	end loop;
	printVector(vec); 
	Put_Line("Suma: ");
	Put_Line(Integer'Image(Suma));
end SumaElementos;



task body getMaximo is
	Temp:Integer:=0;
	begin
	Put_Line ("Comienzo ejecución tarea Maximo"); 
	for I in vec'Range loop
		if vec(I)>Temp then
			Temp:=vec(I);
		end if;
	end loop;
	Maximo:=Temp;
	printVector(vec);	
	Put_Line("Maximo: ");
	Put_Line(Integer'Image(Maximo));
end getMaximo;
			

-----------------
--Tareas suministradas
-----------------

task body A is 
begin
  Put_Line ("Comienzo ejecución tarea A"); 
  Put_Line ("AAAA"); 
  delay (0.0);
  Put_Line ("AAAA");
end A;

task body B is
begin
  Put_Line ("Comienzo ejecución tarea B"); 
  Put_Line ("BBBB"); 
  delay (0.0);
  Put_line ("BBBB");
end B;


--------------
--Procedimiento implementado
--------------

procedure printVector(vec : in Vector) is
	begin
	New_Line;
	Put ("Vector: (");
	for I in Vector'Range loop
		Put(Integer'Image(vec(I)));
		if I<vec'Last then 
		Put(", ");
		end if;
	end loop;
	Put(")");
	New_Line;
end printVector;

--------------------------
----Cuerpo del programa
-------------------------

begin
   Put_Line ("hola");
   delay (0.0);
   Put_Line ("adios");

end lanzatareas;



