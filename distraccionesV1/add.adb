
with Kernel.Serial_Output; use Kernel.Serial_Output;
with Ada.Real_Time; use Ada.Real_Time;
with System; use System;

with Tools; use Tools;
with Devices; use Devices;
with sintomas; use sintomas;
with medidas; use medidas;

-- Packages needed to generate pulse interrupts       
-- with Ada.Interrupts.Names;
-- with Pulse_Interrupt; use Pulse_Interrupt;

package body add is

    ----------------------------------------------------------------------
    ------------- procedure exported 
    ----------------------------------------------------------------------
    procedure Background is
    begin
      loop
        null;
      end loop;
    end Background;
    ----------------------------------------------------------------------

    -----------------------------------------------------------------------
    ------------- declaration of tasks 
    -----------------------------------------------------------------------

    -- Aqui se declaran las tareas que forman el STR
     
   task LeeDistancia is 
	pragma priority (3);
   end LeeDistancia;

   task LeeCabeza is 
	pragma priority (2);
   end LeeCabeza;


   task LeeVolante is 
	pragma priority (1);
   end LeeVolante;

   task Display is
	pragma priority (4);
   end Display;
	

   task Riesgos is
	pragma priority(8);
   end Riesgos;

    

    -----------------------------------------------------------------------
    ------------- body of tasks 
    -----------------------------------------------------------------------

    -- Aqui se escriben los cuerpos de las tareas  

    task body leeDistancia is

    Current_D: Distance_Samples_Type := 0;
    Current_V: Speed_Samples_Type := 0;
    d_seg: Distance_Samples_Type:=0;
   
    begin
	loop
		Starting_Notice("leeDistancia");
			Reading_Distance (Current_D);
			medidasProtegido.setDistancia(Current_D); 
				--Display_Distance (Current_D);

			Reading_Speed (Current_V);
			medidasProtegido.setVelocidad(Current_V);
            			--Display_Speed (Current_V);

            		d_seg:= Distance_Samples_Type(Current_V / 10 ) **2 ;
			--d_seg:= d_seg*d_seg;



			if(medidasProtegido.getDistancia < (d_seg/3)) then
				sintomasProtegido.setDistancia(PELIGRO);
			
			elsif(medidasProtegido.getDistancia < (d_seg/2)) then
				sintomasProtegido.setDistancia(IMPRUDENTE);
				
			elsif (medidasProtegido.getDistancia < d_seg) then 
				sintomasProtegido.setDistancia(INSEGURA);
				
			end if;
				
			Finishing_Notice("leeDistancia");
		delay until (Clock + To_time_Span(0.3));
    end loop;
    end leeDistancia;
			
----------	

    task body leeCabeza is 
 	Current_H: HeadPosition_Samples_Type := (0,0);
	H_Before: HeadPosition_Samples_Type := (0,0);	
	Current_S: Steering_Samples_Type := 0;
    begin
	
	loop
		
		Starting_Notice("leeCabeza");
		
		Reading_HeadPosition (Current_H);
           	--Display_HeadPosition_Sample (Current_H);
               -- Display_HeadPosition_Sample (H_Before);
		Reading_Steering (Current_S);
         	--Display_Steering (Current_S);


		if((Current_H(x) > 30 AND H_Before(x) > 30) OR (Current_H(x)< -30 AND H_Before(x)< -30) ) then
				sintomas.setCabeza(True);
		end if;
		
		if((Current_H(y) > 30 AND H_Before(y) > 30  ) OR (Current_H(y)< -30 AND H_Before(y)< -30)) then
				if((Current_S > 30 AND Current_H(y)> 30)OR(Current_S < -30 AND Current_H(y) < -30)) then
					sintomas.setCabeza(True);
			        end if;
		end if;

		
		Finishing_Notice("leeCabeza");
		
		delay until (Clock + To_time_Span(0.4));
		
		H_Before:= Current_H;
		
	end loop;
			
    end leeCabeza;

	
    task body leeVolante is 
 	S_Before: Steering_Samples_Type := 0;	
	Current_S: Steering_Samples_Type := 0;
	Current_V: Speed_Samples_Type := 0;
    begin
	
	loop
		
		Starting_Notice("leeVolante");
		          	
                Reading_Speed (Current_V);
		Reading_Steering (Current_S);
         	--Display_Steering (Current_S);
		--Display_Steering (S_Before);
		--Display_Speed (Current_V);


		if(((Steering_Samples_Type(S_Before + 20) < Current_S)  OR (Steering_Samples_Type(S_Before - 20) > Current_S)) AND Current_V > 40 ) then
				sintomas.setVolante(True);
		end if;
	
		
		Finishing_Notice("leeVolante");
		
		delay until (Clock + To_time_Span(0.35));
		
		S_Before:= Current_S;
		
	end loop;
			
    end leeVolante;


  task body Display is 

	MDist:  Distance_Samples_Type := 0;
	MVelo:  Speed_Samples_Type := 0;

	begin
	
	loop
		--VALORES NUMERICOS---
		MDist:= medidas.getDistancia();
		Display_Distance(MDist);
		MVelo:= medidas.getVelocidad();
		Display_Speed (MVelo);
		
		
		
		
		--VALORES DE SINTOMAS---
		if(sintomas.getDistancia()== INSEGURA) then
			Put("Distancia Insegura");
		elsif(sintomas.getDistancia()==  IMPRUDENTE) then
			Put("Distancia Imprudente");
		elsif(sintomas.getDistancia()== COLISION) then
			Put("Peligro de colision");
		end if;
		

 		if(sintomas.getVolante()== true) then
			Put("Volantazo");
		end if;

		if(sintomas.getCabeza()== true) then 
			Put("Cabeza inclinada");		
		end if;


		delay until (Clock + To_time_Span(1));
	end loop;

end Display;
	

task body Riesgos is

	SCabeza: boolean:=false;
	SDistIn: boolean:=false;
	SDistIm: boolean:=false;
	SDistPe: boolean:=false;
	SVolante: boolean:=false;

	begin
	
	loop	
		
		--VALORES DE SINTOMAS---
		if(sintomas.getDistancia()== INSEGURA) then
			SDistIn:=true;
		elsif(sintomas.getDistancia()== IMPRUDENTE) then
			SDistIm:=true;
		elsif(sintomas.getDistancia()== PELIGRO) then
			SDistPe:=true;
		else 
			SDistIn:=false;
			SDistIm:=false;
			SDistPe:=false;
		end if;
		

 		if(sintomas.getVolante()== true) then
			SVolante:=true;
		else 
			SVolante:=false;	
		end if;

		if(sintomas.getCabeza()== true) then 
			SCabeza:=true;
		else
			SCabeza:=false;
		end if;
		
		if(SVolante==true AND SDist==false AND SCabeza==false) then
			Beep(1);
		end if;

		if(SCabeza==true AND MVelo < 70) then
			Beep(2);
		elsif (SCabeza==true AND MVelo > 70) then
			Beep(3);
		end if;
		
		if(SDistIn==true) then
			Light(On);
		elsif(SDistIm==true) then
			Beep(4);
			Light(On);
		else
			Light(Off);
		end if;

		if (SDistPe == true AND SCabeza== true) then
			Beep(5);
			Activate_Brake;
		endif;

		delay until (Clock + To_time_Span(0.15));
	end loop;

end Riesgos;
	
	
    ----------------------------------------------------------------------
    ------------- procedure para probar los dispositivos 
    ----------------------------------------------------------------------
    --procedure Prueba_Dispositivos; 

   -- Procedure Prueba_Dispositivos is
       -- Current_V: Speed_Samples_Type := 0;
       -- Current_H: HeadPosition_Samples_Type := (+2,-2);
       -- Current_D: Distance_Samples_Type := 0;
      --  Current_O: Eyes_Samples_Type := (70,70);
      --  Current_E: EEG_Samples_Type := (1,1,1,1,1,1,1,1,1,1);
       -- Current_S: Steering_Samples_Type := 0;
   -- begin
     --    Starting_Notice ("Prueba_Dispositivo");

      --   for I in 1..20 loop
         -- Prueba distancia
           -- Reading_Distance (Current_D);
           -- Display_Distance (Current_D);
           -- if (Current_D < 40) then Light (On); 
                             -- else Light (Off); end if;

         -- Prueba velocidad
            --Reading_Speed (Current_V);
            --Display_Speed (Current_V);
            --if (Current_V > 110) then Beep (2); end if;

         -- Prueba volante
         -- Reading_Steering (Current_S);
         -- Display_Steering (Current_S);
         -- if (Current_S > 30) OR (Current_S < -30) then Light (On);
         --                                            else Light (Off); end if;

         -- Prueba Posicion de la cabeza
            --Reading_HeadPosition (Current_H);
            --Display_HeadPosition_Sample (Current_H);
            --if (Current_H(x) > 30) then Beep (4); end if;

         -- Prueba ojos
            --Reading_EyesImage (Current_O);
            --Display_Eyes_Sample (Current_O);

         -- Prueba electroencefalograma
            --Reading_Sensors (Current_E);
            --Display_Electrodes_Sample (Current_E);
   
         --delay until (Clock + To_time_Span(0.2));
         --end loop;

        --Finishing_Notice ("Prueba_Dispositivo");
    --end Prueba_Dispositivos;


begin
   Starting_Notice ("Programa Principal");
   Finishing_Notice ("Programa Principal");
end add;



