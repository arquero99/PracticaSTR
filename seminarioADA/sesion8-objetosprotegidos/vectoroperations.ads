	
package vectoroperations is
	
	type Vector is array (1..50) of integer;

	Protected lanzatareasProtegido is
		procedure printVector;
		procedure ordenaProtected;
		procedure sumaProtected;
		function maxProtected return integer;
	
		private

		vec : Vector:=(1=>10 ,3=>17 ,4=>154 ,10=>40 ,15=>8 ,20=>21 ,26=>15 ,30=>27 ,33=>88 ,41=>11 ,48=>66, others => 0 );
	
		Suma : Integer;

	end lanzatareasProtegido;


	task Ordena;
	task SumaElementos;
	task getMaximo;

end vectoroperations;
