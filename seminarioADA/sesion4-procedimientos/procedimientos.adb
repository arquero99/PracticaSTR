with Kernel.Serial_Output; use Kernel.Serial_Output;	

procedure procedimientos is

subtype Dia_del_mes is Integer range 1..31;
type Agua_recogida is array (Dia_del_mes) of integer;

-----------------------------------------------------
-- Declaraciones
-----------------------------------------------------
procedure Incrementar (d: in integer);
procedure Modificar (elemento: in Dia_del_Mes; d: in integer; ant: out integer);
function Leer (j: in Dia_del_Mes) return integer;

Enero : Agua_recogida := (15=>20, 16=>40, 17=>30, others=>0);
valor_anterior: integer;

--------------------------------------------------------
-- Procedimientos
--------------------------------------------------------
  procedure Incrementar (d: in integer) is
  begin
    for i in Dia_del_Mes loop
      Enero (i) := Enero (i) + d;
    end loop;
  end Incrementar;

  procedure Modificar (elemento: in Dia_del_Mes; d: in integer; ant: out integer) is
  begin
    ant := Enero (elemento); 
    Enero (elemento) :=  d;
    Put ("Modificado elemento ");
    put(Dia_del_Mes'Image(elemento));
    Put (" con nuevo valor ");
    put(integer'Image(d));
  end Modificar;

  function Leer (j: in Dia_del_Mes) return integer is
  begin
    return Enero (j);
  end Leer;

--------------------------------------------------------
-- Cuerpo del programa principal
--------------------------------------------------------
begin
  New_line;
  Put ("Agua recogida durante mes de Enero"); 
  New_line;

  Incrementar(2);

  Modificar(2,3,valor_anterior);
  Put (" valor anterior ");
  Put(integer'Image(valor_anterior));
  New_Line;

  Modificar(4,11,valor_anterior);
  Put (" valor anterior ");
  Put(integer'Image(valor_anterior));
  New_Line;

  declare -- Esto es un bloque
   k:integer;
  begin 
    Put_Line ("Valores finales ");
    for i in Dia_del_Mes loop
      k:=Leer(i);
      put(Integer'Image(k));
    end loop;
  end;  -- Fin del bloque


end procedimientos;
