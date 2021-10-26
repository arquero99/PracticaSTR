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