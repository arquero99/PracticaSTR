with devices use devices;

package medidas is
	Protected medidasProtegido is
		procedure setDistancia(dist in: Distance_Samples_Type);			//Creados métodos y objeto usando tipo distancia declarado en devices.ads
		function getDistancia return Distance_Samples_TypeDis;
		private 
			distMetros : Distance_Samples_Type;
			velocidad :  Speed_Samples_Type;
	end medidasProtegido;
end medidas;
