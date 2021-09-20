
with Kernel.Serial_Output; use Kernel.Serial_Output;
with paquete; -- use paquete;

procedure pru5 is

valor_anterior: integer;

begin
  Put ("Comienza pru5 ");
  New_Line;

  Put ("Agua recogida durante mes de Enero");
  New_line;

  paquete.Incrementar(2);

  paquete.Modificar(2,3,valor_anterior);
  Put (" valor anterior ");
  Put(integer'Image(valor_anterior));
  New_Line;

  paquete.Modificar(4,11,valor_anterior);
  Put (" valor anterior ");
  Put(integer'Image(valor_anterior));
  New_Line;

  declare -- Esto es un bloque
   k:integer;
  begin
    Put_Line ("Valores finales ");
    for i in paquete.Dia_del_Mes loop
      k:= paquete.Leer(i);
      put(Integer'Image(k));
    end loop;
  end;  -- Fin del bloque

end pru5;

