
with Kernel.Serial_Output; use Kernel.Serial_Output;

package body datoprivado is


--------------------------------------------------------
-- Cuerpo de los Procedimientos
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




begin
   Put ("-- inicializacion del paquete");
   Enero := (15=>20, 16=>40, 17=>30, others=>0);
end datoprivado;

