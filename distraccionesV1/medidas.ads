with devices use devices;

package medidas is
	Protected medidasProtegido is
		procedure setDistancia(dist in: Distance_Samples_Type);			//Creados métodos y objeto usando tipo distancia declarado en devices.ads
		procedure getDistancia();
		private 
			distMetros : Distance_Samples_Type; 
	end medidasProtegido;
end medidas;
