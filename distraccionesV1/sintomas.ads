package sintomas is

type situacionDist is (INSEGURA, IMPRUDENTE, PELIGRO, SEGURA);

	Protected sintomasProtegido is 

		procedure setCabeza(pos: in boolean);
		procedure setDistancia (dist: in situacionDist);	
		procedure setVolante(vol: in boolean);
			
		function getCabeza return boolean;
		function getDistancia return situacionDist;						
		function getVolante return boolean;
		
private
			cabezaInclinada : boolean;
			distActual : situacionDist;
			volantazo: boolean;
	end sintomasProtegido;
end sintomas;
