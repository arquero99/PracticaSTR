with Kernel.Serial_Output; use Kernel.Serial_Output;	

procedure lluvia is

subtype Dia_del_mes is Integer range 1..31;
type Agua_recogida is array (Dia_del_mes) of integer;

Protected Datos is
  procedure Incrementar (d: in integer);
  procedure Modificar (d: integer);
  function Leer (j: in Dia_del_Mes) return integer;
private 
  Enero : Agua_recogida := (15=>20, 16=>40, 17=>30, others=>0);
end Datos;

task A;
task B;
task C;

task body A is
 begin
   Datos.Incrementar(2);
 end A;

task body B is
 begin
   delay 0.0;
   Datos.Modificar(3);
 end B;

task body C is
 k:integer;
 begin
   delay (0.5);
   for i in Dia_del_Mes loop
    k:=Datos.Leer(i);
    put(Integer'Image(k));
   end loop;
 end C;

protected body Datos is 
  procedure Incrementar (d: in integer) is
  begin
    for i in Dia_del_Mes loop
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

end Datos;
begin
  Put ("Agua recogida durante mes de Enero"); 
  New_line;
end lluvia;
