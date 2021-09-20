with Kernel.Serial_Output; use Kernel.Serial_Output;	

procedure tipos1 is

-- Tipos y subtipos enumerados

type dias_semana is (lunes,martes,miercoles,jueves,viernes,sabado,domingo);

type entresemana is (lunes,martes,miercoles,jueves,sabado,dmingo); 

subtype dias_laborables is dias_semana range lunes..viernes;
subtype dias_findesemana is dias_semana range sabado..domingo;

hoy, otro_dia: dias_semana;
reunion_1: entresemana;
reunion_2: dias_laborables;
teatro: dias_findesemana; 

begin

  hoy := lunes;
  otro_dia := domingo;

  reunion_1 := martes;
  reunion_2 := miercoles; 
  teatro := sabado;

  -- reunion_1:= hoy; -- error compilacion!! 
  reunion_2:= hoy; -- correcto
  teatro := otro_dia; 

  Put ("Se imprimen los valores: ");
  New_line;

  Put (entresemana'Image(reunion_1)); New_Line;
  Put (dias_laborables'Image(reunion_2)); New_Line;
  Put (dias_findesemana'Image(teatro)); New_Line; 
  
 
end;
