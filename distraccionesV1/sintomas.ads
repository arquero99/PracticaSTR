package sintomas is

type situacionDist is (INSEGURA, IMPRUDENTE, PELIGRO, SEGURA);

	Protected sintomasProtegido is 

		procedure setCabezaInclinada(pos: in boolean);
		procedure setDistancia (dist: in situacionDist);	
		procedure setVolante(vol: in boolean);
			
		function getCabezaInclinada return boolean;
		--function getDistancia return situacionDist;						te
		function getVolante return boolean;
		
private
			cabezaInclinada : boolean;
			distActual : situacionDist;
			volantazo: boolean;
	end sintomasProtegido;
end sintomas;
