package sintomas is

	Protected sintomasProtegido is 
		procedure setCabezaInclinada(pos: in boolean);
		procedure setDistancia (dist: in situacionDist);	
		procedure setVolante(vol: in boolean);						//Incluir geters
		procedure getCabezaInclinada();
		procedure getDistancia();							//Incluir variables para volante
		procedure getVolante();
		private
			cabezaInclinada : boolean;
			distActual : situacionDist;
			volantazo: boolean;
	end sintomasProtegido;
end sintomas;
