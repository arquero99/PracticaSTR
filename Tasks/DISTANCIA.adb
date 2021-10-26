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