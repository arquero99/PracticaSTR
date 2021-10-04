with Kernel.Serial_Output; use Kernel.Serial_Output;
with vectorprotegido; use vectorprotegido;

package body vectorprotegidotasks is

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

end vectorprotegidotasks;
