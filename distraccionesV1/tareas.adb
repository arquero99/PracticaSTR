
package body tareas is

	
//CABEZA

	task LeeCabeza is 
	pragma priority (2);			
   	end LeeCabeza;

	task body leeCabeza is 
 	Current_H: HeadPosition_Samples_Type := (0,0);
	H_Before: HeadPosition_Samples_Type := (0,0);	
	Current_S: Steering_Samples_Type := 0;
    	begin
	
	loop
		
		Starting_Notice("leeCabeza");
		
		Reading_HeadPosition (Current_H);
           	Display_HeadPosition_Sample (Current_H);
                Display_HeadPosition_Sample (H_Before);
		Reading_Steering (Current_S);
         	Display_Steering (Current_S);


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

//DISTANCIA

	task LeeDistancia is 
		pragma priority (3);
	end LeeDistancia;



	task body leeDistancia is

   	 Current_D: Distance_Samples_Type := 0;
   	 Current_V: Speed_Samples_Type := 0;				
    	 d_seg: Distance_Samples_Type:=0;
   
    	begin
	loop
		Starting_Notice("leeDistancia");
			Reading_Distance (Current_D);
            			Display_Distance (Current_D);
            			if (Current_D < 40) then 
						Light (On); 
                             	 	else Light (Off); 
				end if;
			Reading_Speed (Current_V);
            		Display_Speed (Current_V);
            		d_seg:= Distance_Samples_Type(Current_V / 10 )  ;
			d_seg:= d_seg*d_seg;

			if(Current_D < (d_seg/3)) then
				Put("PELIGRO DE COLISION");
			elsif(Current_D < (d_seg/2)) then
				Put("DISTANCIA IMPRUDENTE");
			elsif (Current_D < d_seg) then 
				Put("DISTANCIA INSEGURA");
			end if;
			
				
			Finishing_Notice("leeDistancia");
		delay until (Clock + To_time_Span(0.3));
    	end loop;

    end leeDistancia;

//VOLANTE

	task LeeVolante is 
		pragma priority (3);
	end LeeVolante;

	task body leeVolante is 
	 	S_Before: Steering_Samples_Type := 0;	
		Current_S: Steering_Samples_Type := 0;
		Current_V: Speed_Samples_Type := 0;
	begin
	
	loop
		
		Starting_Notice("leeVolante");
		          	
                Reading_Speed (Current_V);
		Reading_Steering (Current_S);
         	Display_Steering (Current_S);
		Display_Steering (S_Before);
		Display_Speed (Current_V);


		if(((Current_S <= Steering_Samples_Type(S_Before + 20)) OR (Current_S >= Steering_Samples_Type(S_Before - 20))) AND (Current_V > 40) ) then
				Put ("Volantazo");
		end if;
		

		
		Finishing_Notice("leeVolante");
		
		delay until (Clock + To_time_Span(0.35));
		
		S_Before:= Current_S;
		
	end loop;
			
   end leeVolante;
