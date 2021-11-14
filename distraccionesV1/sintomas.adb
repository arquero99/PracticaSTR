package body sintomas is
	
	Protected body sintomasProtegido is
		
		procedure setCabeza (pos: in boolean) is    --Procedimiento que dada una posicion setea el valor en objeto protegido 		
			begin
			sintomasProtegido.cabezaInclinada:=pos;
		end setCabezaInclinada;	

		procedure setDistancia (dist: in situacionDist) is	--Procedimiento para establecer valor de enumerado distActual
			begin
			sintomasProtegido.distActual:=dist;
		end setDistancia;
		
		procedure setVolante (vol: in boolean) is	--Procedimiento para establecer estado del volante
			begin
			sintomasProtegido.volantazo:=vol;
		end setVolante;


		
		function getCabezaInclinada return boolean is  
			begin 
			return sintomasProtegido.cabezaInclinada;
		end getCabezaInclinada;
		
		function getDistancia return situacionDist is
			begin					
			return sintomasProtegido.distActual;
		end getDistancia;

		function getVolante return boolean is
			begin
			return sintomasProtegido.volantazo;
		end getVolante;
	
	end sintomasProtegido;
end sintomas;

