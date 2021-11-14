
with Kernel.Serial_Output; use Kernel.Serial_Output;
with Ada.Real_Time; use Ada.Real_Time;
with System; use System;

with Tools; use Tools;
with Devices; use Devices;
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
            			--Display_Distance (Current_D);
			Reading_Speed (Current_V);
            			--Display_Speed (Current_V);
            		
			medidasProtegido.setDistancia(Current_D);
			medidasProtegido.setVelocidad(Current_V);			

			d_seg:= Distance_Samples_Type(medidasProtegido.getVelocidad / 10 ) ** 2 ;
			--d_seg:= d_seg*d_seg;
			

			if(medidasProtegido.getDistancia < (d_seg/3)) then
				Put("PELIGRO DE COLISION");
			elsif(medidasProtegido.getDistancia < (d_seg/2)) then
				Put("DISTANCIA IMPRUDENTE");
			elsif (medidasProtegido.getDistancia < d_seg) then 
				Put("DISTANCIA INSEGURA");
			end if;
			
				
			Finishing_Notice("leeDistancia");
		delay until (Clock + To_time_Span(0.3));
    end loop;
    end leeDistancia;

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
				Put ("Cabeza inclinada en X");
		end if;
		
		if((Current_H(y) > 30 AND H_Before(y) > 30  ) OR (Current_H(y)< -30 AND H_Before(y)< -30)) then
				Put ("Cabeza inclinada en Y");
				if((Current_S > 30 AND Current_H(y)> 30)OR(Current_S < -30 AND Current_H(y) < -30)) then
					Put("Somnolencia");
				
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
				Put ("Volantazo");
		end if;
	
		
		Finishing_Notice("leeVolante");
		
		delay until (Clock + To_time_Span(0.35));
		
		S_Before:= Current_S;
		
	end loop;
			
    end leeVolante;
	
	
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



