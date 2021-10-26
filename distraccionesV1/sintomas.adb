type situacionDist is (DISTANCIA INSEGURA, DISTANCIA IMPRUDENTE, PELIGRO DE COLISION);

package body sintomas is
	
	Protected body sintomasProtegido is
		
		procedure setCabezaInclinada(pos: in boolean) is    //Procedimiento que dada una posicion setea el valor en objeto protegido 		
			begin
			sintomasProtegido.cabezaInclinada=pos;
		end setCabeza;	

		procedure setDistancia (dist: in situacionDist) is	//Procedimiento para establecer valor de enumerado distActual
			begin
			sintomasProtegido.distActual=dist;
		end setDistancia;
	
	end sintomasProtegido;
begin
null;

end sintomas;
