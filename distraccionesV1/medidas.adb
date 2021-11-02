with devices use devices;

package body medidas is 
	Protected medidasProtegido is 
		procedure setDistancia(dist in: Distance_Samples_Type) is
			begin
			medidasProtegido.distMetros=dist;
		end setDistancia;

		function getDistancia return Distance_Samples_Type is 
			begin
			return medidasProtegido.distMetros;
		end getDistancia;
	end medidasProtegido;
end medidas;

