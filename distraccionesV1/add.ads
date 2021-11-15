package add is
  procedure Background;

  task LeeDistancia is 
	pragma priority (3);
   end LeeDistancia;

   task LeeCabeza is 
	pragma priority (5);
   end LeeCabeza;


   task LeeVolante is 
	pragma priority (2);
   end LeeVolante;

   task Display is
	pragma priority (1);
   end Display;

   task Riesgos is 
	pragma priority (4);
   end Riesgos;

 end add;

