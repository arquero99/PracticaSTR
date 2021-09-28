with Kernel.Serial_Output; use Kernel.Serial_Output;

package body vectoroperations is
	


	-----------------
	--Tareas Implementadas
	------------------

	task body Ordena is
	begin
		Put_Line ("Vector original: ");
		lanzatareasProtegido.printVector;
		Put_Line ("Ordenando");
		lanzatareasProtegido.ordenaProtected;
	end Ordena;



	task body SumaElementos is
	begin
		Put_Line("Sumando");
		lanzatareasProtegido.sumaProtected;
	end SumaElementos;



	task body getMaximo is
		Maximo : Integer;
	begin
		Put_Line("Calculando Maximo");
		Maximo:=lanzatareasProtegido.maxProtected;
		Put_Line(Integer'Image(Maximo));
	end getMaximo;

	-- Funciones protegidas propias de los objetos protegidos

	Protected body lanzatareasProtegido is
	
		procedure printVector is
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

		procedure ordenaProtected is 
		Temp : Integer;
		begin
			for I in reverse Vector'Range loop
			for J in Vector'First .. I loop
				if lanzatareasProtegido.vec(I) < lanzatareasProtegido.vec(J) then
					Temp := vec(J);
					vec(J) := vec(I);
					vec(I) := Temp;
				end if;
			end loop;
			end loop;
			printVector;
		end ordenaProtected;

		procedure sumaProtected is
		begin
			Suma:=0;
			for I in vec'Range loop
				Suma:= Suma + vec(I);
			end loop;
			printVector;
			New_Line;
			Put_Line("Suma: ");
			Put(Integer'Image(Suma));
			New_Line;
		end sumaProtected;

		function maxProtected return integer is
		Temp:Integer:=0;
		begin	
			for I in vec'Range loop
				if vec(I)>Temp then
					Temp:=vec(I);
				end if;
			end loop;
			--printVector;
			return Temp;
		end maxProtected;
	
	end lanzatareasProtegido;

--begin
	--Put_Line ("Comenzando ejecución de cuerpo del paquete");
	--delay (0.0);
	--Put_Line ("adios");

end vectoroperations;
