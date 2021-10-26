package sintomas is

	Protected sintomasProtegido is 
		procedure setCabezaInclinada(pos: in boolean);
		procedure setDistancia (dist: in situacionDist);

		private
			cabezaInclinada : boolean;
			distActual : situacionDist;
	end sintomasProtegido;
end sintomas;
