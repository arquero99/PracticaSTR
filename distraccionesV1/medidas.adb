with devices; use devices;

package body medidas is 

	Protected body medidasProtegido is 
		procedure setDistancia(dist : in Distance_Samples_Type) is
			begin
			distMetros:=dist;
		end setDistancia;

		function getDistancia return Distance_Samples_Type is 
			begin
			return distMetros;
		end getDistancia;
		
		procedure setVelocidad (vel : in Speed_Samples_Type) is
			begin
			velocidad:=vel;
		end setVelocidad;

		function getVelocidad return Speed_Samples_Type is 
			begin
			return velocidad;
		end getVelocidad;
	
	end medidasProtegido;

end medidas;

--begin 
	--null;
--end medidas;
