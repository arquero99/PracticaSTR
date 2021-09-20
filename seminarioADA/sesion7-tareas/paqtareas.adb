
with Kernel.Serial_Output; use Kernel.Serial_Output;

package body paqtareas is

procedure p1 is
begin
   Put_Line ("... se ejecuta paquete.p1 ");
end p1;

procedure p2 is
begin
   Put_Line  ("... se ejecuta paquete.p2 ");
end p2;


task body A is
begin
  Put_Line ("AAAA");
  delay (0.0);
  Put_Line ("AAAA");
end A;

task body B is
begin
  Put_Line ("BBBB");
  delay (0.0);
  Put_line ("BBBB");

end B;


begin
   Put_Line  ("-- parte principal del paquete de tareas");

end paqtareas;

