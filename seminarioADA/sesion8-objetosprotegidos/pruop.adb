with Kernel.Serial_Output; use Kernel.Serial_Output;	

procedure pruop is

subtype Dia_del_mes is Integer range 1..31;
type Agua_recogida is array (Dia_del_mes) of integer;

-----------------------------------------------------
-- Declaraciones
-----------------------------------------------------
procedure Incrementar (d: in integer);
procedure Modificar (d: integer);
function Leer (j: in Dia_del_Mes) return integer;

Enero : Agua_recogida := (15=>20, 16=>40, 17=>30, others=>0);

task A;
task B;
task C;

-----------------------------------------------------
-- Tareas
-----------------------------------------------------
task body A is
 begin
   Incrementar(2);
 end A;

task body B is
 begin
   Modificar(3);
 end B;

task body C is
 k:integer;
 begin
   delay (3.0);
   for i in Dia_del_Mes loop
    k:=Leer(i);
    put(Integer'Image(k));
   end loop;
 end C;

--------------------------------------------------------
-- Procedimientos
--------------------------------------------------------
  procedure Incrementar (d: in integer) is
  begin
    for i in 1..15 loop
      Enero (i) := Enero (i) + d;
    end loop;
    delay (0.0);
    for i in 15..Dia_del_Mes'last loop
      Enero (i) := Enero (i) + d;
    end loop; 
  end Incrementar;

  procedure Modificar (d: in integer) is
  begin
    for i in Dia_del_Mes loop
      Enero (i) :=  d;
    end loop;
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
end pruop;
