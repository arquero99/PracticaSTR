with Kernel.Serial_Output; use Kernel.Serial_Output;	

procedure agua_recogida is

subtype Dia_del_mes is Integer range 1..31;
type Agua_recogida is array (Dia_del_mes) of integer;

type numero_real is digits 3 range 0.0..100.0; -- coma flotante

Enero : Agua_recogida := (15=>20, 16=>40, 17=>30, others=>0);

i : Dia_del_mes;
suma: integer := 0;
media: float := 0.0;
media_aritmetica: numero_real := 0.0;

begin
  New_Line;
  Put ("Agua recogida"); 
  New_line;
  Put ("Enero:");
  i:=1;
  loop 
    Put(integer'Image(Enero(i)));
    suma := suma + Enero(i);
    exit when i=31;
    i:=i+1;
  end loop;
  New_line;

  Put ("Suma total = ");
  Put (integer'Image(suma)); New_line;

  Put ("Media operando con enteros = ");
  media := float(suma / dia_del_mes'Last);
  Put (float'Image(media)); New_line;

  media := 0.0;
  Put ("Media con operandos en coma flotante = ");
  media := (float(suma) / float(dia_del_mes'Last));
  Put (float'Image(media)); New_line;

  Put ("Media limitanto el numero de decimales = ");
  media_aritmetica := (numero_real(suma) / numero_real(dia_del_mes'Last));
  Put (numero_real'Image(media_aritmetica)); New_line;

  media_aritmetica := 0.0;
  Put ("Media dividiendo directamente entre 31 = ");
  -- media_aritmetica := numero_real(Suma) / 31; -- Esto da error de compilacion!!
  Put (numero_real'Image(media_aritmetica)); New_line;
end;
