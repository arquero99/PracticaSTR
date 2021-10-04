package vectorprotegido is

	--Paquete que incluye vector instanciado en objeto protegido para asegurar exclusión mutua

	type Vector is array (1..50) of integer;

	--Inicio del objeto protegido
	
	Protected lanzatareasProtegido is
		procedure printVector;
		procedure ordenaProtected;
		procedure sumaProtected;
		function maxProtected return integer;
	
		private
		-- Instanciación del objeto dentro de la parte protegida

		vec : Vector:=(1=>10 ,3=>17 ,4=>154 ,10=>40 ,15=>8 ,20=>21 ,26=>15 ,30=>27 ,33=>88 ,41=>11 ,48=>66, others => 0 );
	
		Suma : Integer;

	end lanzatareasProtegido;

end vectorprotegido;
