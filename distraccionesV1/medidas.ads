with devices use devices;

package medidas is
	Protected medidasProtegido is
		procedure setDistancia(dist in: Distance_Samples_Type);			--Creados métodos y objeto usando tipo distancia y velocidad declarado en devices.ads
		function getDistancia return Distance_Samples_TypeDis;
		procedure setVelocidad(vel in: Speed_Samples_Type);
		function getVelocidad return Speed_Samples_Type;
		private 
			distMetros : Distance_Samples_Type;
			velocidad :  Speed_Samples_Type;
	end medidasProtegido;
end medidas;
