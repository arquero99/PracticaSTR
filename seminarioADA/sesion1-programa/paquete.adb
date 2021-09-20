
with Kernel.Serial_Output; use Kernel.Serial_Output;

package body paquete is

procedure p1 is
begin
   Put ("... se ejecuta paquete.p1 ");
end p1;

procedure p2 is
begin
   Put ("... se ejecuta paquete.p2 ");
end p2;


begin
   Put ("-- parte principal del paquete");

end paquete;

