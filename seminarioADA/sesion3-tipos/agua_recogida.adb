--Programa creado por Juan Arquero para STR el 21/09/21


with Kernel.Serial_Output; use Kernel.Serial_Output;	

procedure agua_recogida is

subtype Dia_del_mes is Integer range 1..31;
type Agua_recogida is array (Dia_del_mes) of integer;

type numero_real is digits 4 range 0.0..1000.0; -- coma flotante

function mediaMesDado (mes : Agua_recogida) return numero_real;
procedure lluviaEntre (mes: in Agua_recogida; x : in Dia_del_mes; y : in Dia_del_mes ; numDias : out Integer; mediaDias : out numero_real);
procedure OrdenaBurbuja (mes : in out Agua_recogida);

Enero : Agua_recogida := (15=>20, 16=>40, 17=>30, others=>0);
Febrero: Agua_recogida := (10=>10, 15=>20, 19=>20, others=>0);
Marzo: Agua_recogida := (5=>50, 7=>40, 25=>10, others=>0);

i : Dia_del_mes;
suma: integer := 0;
sumaEnero : integer := 0;
sumaFebrero : integer := 0;
sumaMarzo : integer := 0;
diasdelluvia : integer :=0;
diaslluviaE : integer := 88;
diaslluviaF : integer := 88;
diaslluviaM : integer := 88;
diasSecos : integer := 0;
pocoE : integer := 0;
muchoE : integer := 0;
pocoF : integer := 0;
muchoF : integer := 0;
pocoM : integer := 0;
muchoM : integer := 0;

media: float := 0.0;
media_aritmetica: numero_real := 0.0;


----------------------------------
--Funciones ejercicio 3
----------------------------------

function mediaMesDado (mes: Agua_recogida) return numero_real is 
mediaMes: numero_real := 0.0;
sumaMes: integer:=0;
begin
	for I in mes'Range loop
		sumaMes:= sumaMes + mes(I);
	end loop;
	mediaMes:=(numero_real(sumaMes) / numero_real(mes'Length));
	return mediaMes;
end mediaMesDado;


procedure lluviaEntre (mes : in Agua_recogida; x : in Dia_del_mes; y : in Dia_del_mes ; numDias : out Integer; mediaDias : out numero_real) is 
sumaDias : integer := 0;
begin
	numDias:=y-x+1;
	mediaDias:=0.0;
	i:=Dia_del_mes(x);
	
	loop
		sumaDias:=sumaDias + mes(i);
		exit when i=Dia_del_mes(y);
		i:=i+1;
	end loop;
	mediaDias:= (numero_real(sumaDias) / numero_real(numDias));
	Put ("Dias de lluvia entre los dias especificados = ");
  	Put (Integer'Image(numDias)); New_line;
	Put ("Media de lluvia entre los dias especificados = ");
  	Put (numero_real'Image(mediaDias)); New_line;

end lluviaEntre;	


procedure OrdenaBurbuja (mes : in out Agua_recogida) is
Temp : Integer;
begin
	for I in reverse mes'Range loop
	for J in mes'First .. I loop
	if mes(I) < mes(J) then
		Temp := mes(J);
		mes(J) := mes(I);
		mes(I) := Temp;
	end if;
	end loop;
	end loop;
end OrdenaBurbuja;




---------------------
--Cuerpo del programa
---------------------


begin

--Enero
  New_Line;
  Put ("Agua recogida"); 
  New_line;
  Put ("Enero:");
  i:=1;
  diasdelluvia:=0;
  loop 
    Put(integer'Image(Enero(i)));
    if Enero(i) > 0 then
	diasdelluvia:= diasdelluvia + 1;
	suma := suma + Enero(i);
	sumaEnero:=sumaEnero + Enero(i);
	if Enero(i) > 25 then
		muchoE := muchoE + 1;
	else
		pocoE := pocoE + 1;
	end if;
    else
 	diasSecos := diasSecos + 1;
	pocoE := pocoE + 1;
    end if;
    
    exit when i=31;
    i:=i+1;
  end loop;
  diaslluviaE:=diasdelluvia;
  diasdelluvia:=0;

--Febrero
New_Line;
  Put ("Febrero:");
  i:=1;
  loop 
    Put(integer'Image(Febrero(i)));
    if Febrero(i) > 0 then
	diasdelluvia:= diasdelluvia + 1;
	suma := suma + Febrero(i);
	sumaFebrero:=sumaFebrero + Febrero(i);
	if Febrero(i) > 25 then
		muchoF := muchoF + 1;
	else
		pocoF := pocoF + 1;
	end if;
    else
 	diasSecos := diasSecos + 1;
	pocoF := pocoF + 1;
    end if;
    exit when i=31;
    i:=i+1;
  end loop;
  diaslluviaF:=diasdelluvia;
  diasdelluvia:=0;

--Marzo
New_Line;
  Put ("Marzo:");
  i:=1;
  loop 
    Put(integer'Image(Marzo(i)));
    if Marzo(i) > 0 then
	diasdelluvia:= diasdelluvia + 1;
	suma := suma + Marzo(i);
	sumaMarzo:=sumaMarzo + Marzo(i);
	if Marzo(i) > 25 then
		muchoM := muchoM + 1;
	else
		pocoM := pocoM + 1;
	end if;
    else
 	diasSecos := diasSecos + 1;
	pocoM := pocoM + 1;
    end if;
    exit when i=31;
    i:=i+1;
  end loop;
  diaslluviaM:=diasdelluvia;
  diasdelluvia:=0;


----------------
--Arrojar calculos y datos obtenidos
----------------

  New_line;
  New_Line;

  Put ("Suma total = ");
  Put (integer'Image(suma)); New_line;

Put ("Suma Enero = ");
  Put (integer'Image(sumaEnero)); New_line;
Put ("Suma Febrero = ");
  Put (integer'Image(sumaFebrero)); New_line;
Put ("Suma Marzo = ");
  Put (integer'Image(sumaMarzo)); New_line;


Put ("Numero de dias que ha llovido en Total= ");
  Put (integer'Image(diaslluviaE + diaslluviaF + diaslluviaM)); New_line;
Put ("Numero de dias que ha llovido en Enero= ");
  Put (integer'Image(diaslluviaE)); New_line;
Put ("Numero de dias que ha llovido en Febrero = ");
  Put (integer'Image(diaslluviaF)); New_line;
Put ("Numero de dias que ha llovido en Marzo = ");
  Put (integer'Image(diaslluviaM)); New_line;


Put ("Numero de dias que ha llovido poco en Enero= ");
  Put (integer'Image(pocoE)); New_line;
Put ("Numero de dias que ha llovido mucho en Enero = ");
  Put (integer'Image(muchoE)); New_line;
Put ("Numero de dias que ha llovido poco en Febrero= ");
  Put (integer'Image(pocoF)); New_line;
Put ("Numero de dias que ha llovido mucho en Febrero = ");
  Put (integer'Image(muchoF)); New_line;
Put ("Numero de dias que ha llovido poco en Marzo= ");
  Put (integer'Image(pocoM)); New_line;
Put ("Numero de dias que ha llovido mucho en Marzo = ");
  Put (integer'Image(muchoM)); New_line;
New_Line;

Put ("Numero de dias que no ha llovido = ");
  Put (integer'Image(diasSecos)); New_line;

New_Line;
New_Line;

  Put ("Media Total operando con enteros = ");
  media := float(suma / dia_del_mes'Last);
  Put (float'Image(media)); New_line;
  Put ("Media Enero operando con enteros = ");
  media := float(sumaEnero / dia_del_mes'Last);
  Put (float'Image(media)); New_line;
  Put ("Media Febrero operando con enteros = ");
  media := float(sumaFebrero / dia_del_mes'Last);
  Put (float'Image(media)); New_line;
  Put ("Media Marzo operando con enteros = ");
  media := float(sumaMarzo / dia_del_mes'Last);
  Put (float'Image(media)); New_line;
New_Line;

  media := 0.0;
  Put ("Media Total con operandos en coma flotante = ");
  media := (float(suma) / float(dia_del_mes'Last));
  Put (float'Image(media)); New_line;
  media := 0.0;
  Put ("Media Enero con operandos en coma flotante = ");
  media := (float(sumaEnero) / float(dia_del_mes'Last));
  Put (float'Image(media)); New_line;
  media := 0.0;
  Put ("Media Febrero con operandos en coma flotante = ");
  media := (float(sumaFebrero) / float(dia_del_mes'Last));
  Put (float'Image(media)); New_line;
  media := 0.0;
  Put ("Media Marzo con operandos en coma flotante = ");
  media := (float(sumaMarzo) / float(dia_del_mes'Last));
  Put (float'Image(media)); New_line;
New_Line;



  Put ("Media Total limitanto el numero de decimales = ");
  media_aritmetica := (numero_real(suma) / numero_real(dia_del_mes'Last));
  Put (numero_real'Image(media_aritmetica)); New_line;
Put ("Media Enero limitanto el numero de decimales = ");
  media_aritmetica := (numero_real(sumaEnero) / numero_real(dia_del_mes'Last));
  Put (numero_real'Image(media_aritmetica)); New_line;
Put ("Media Febrero limitanto el numero de decimales = ");
  media_aritmetica := (numero_real(sumaFebrero) / numero_real(dia_del_mes'Last));
  Put (numero_real'Image(media_aritmetica)); New_line;
Put ("Media Marzo limitanto el numero de decimales = ");
  media_aritmetica := (numero_real(sumaMarzo) / numero_real(dia_del_mes'Last));
  Put (numero_real'Image(media_aritmetica)); New_line;

  media_aritmetica := 0.0;
  Put ("Media dividiendo directamente entre 31 = ");
  -- media_aritmetica := numero_real(Suma) / 31; -- Esto da error de compilacion!!
  Put (numero_real'Image(media_aritmetica)); New_line;

---------------
--Llamadas a funciones/procesos implementados
---------------
New_Line;
Put("Llamadas a funciones/procesos implementados");
New_Line;
Put("Enero: ");
Put(numero_real'Image(mediaMesDado(Enero)));
New_Line;
Put("Febrero: ");
Put(numero_real'Image(mediaMesDado(Febrero)));
New_Line;
Put("Marzo: ");
Put(numero_real'Image(mediaMesDado(Marzo)));
New_Line;


end agua_recogida;




