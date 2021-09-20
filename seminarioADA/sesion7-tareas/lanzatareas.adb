
with Kernel.Serial_Output; use Kernel.Serial_Output;

procedure lanzatareas is

--   pragma Priority (System.Priority'First);

task A;
task B;

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
   Put_Line ("hola");
   delay (0.0);
   Put_Line ("adios");

end lanzatareas;
