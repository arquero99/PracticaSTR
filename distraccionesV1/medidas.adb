with devices use devices;

package body medidas is 

	Protected body medidasProtegido is 
		procedure setDistancia(dist : in Distance_Samples_Type) is
			begin
			medidasProtegido.distMetros:=dist;
		end setDistancia;

		function getDistancia return Distance_Samples_Type is 
			begin
			return medidasProtegido.distMetros;
		end getDistancia;
		
		procedure setVelocidad (vel : in Speed_Samples_Type) is
			begin
			medidasProtegido.velocidad:=vel;
		end setVelocidad;

		function getVelocidad return Speed_Samples_Type is 
			begin
			return medidasProtegido.velocidad;
		end getDistancia;
	private 
		distMetros: Distance_Samples_Type;
		velocidad: Speed_Samples_Type;

	end medidasProtegido;
end medidas;

begin 
	null;
end medidas;
