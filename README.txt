HOLA :)

Somos Raul Torres y Juan Arquero y en este directorio presentamos los ficheroos necesarios para realizar la practica de STR.

#Descripción del programa (Especificaciones): 

##DETECCIÓN DE SÍNTOMAS
El sistema leerá y analizará los datos recogidos de los sensores para detectar los siguientes indicios que pueden
llevar a una situación de riesgo.
### Cabeza Inclinada: Se leerá el Giróscopo cada 400 ms. Si la inclinación en el eje X es mayor de 30 grados en
al menos dos lecturas consecutivas se interpretará que el conductor tiene la Cabeza Inclinada hacia delante
(+30º) o hacia atrás (-30º) y puede estar dando síntomas de somnolencia o distracción. En caso de que se
produzcan las dos inclinaciones consecutivas en el eje Y, hacia la izquierda (-30º) o hacia la derecha (+30º),
si el conductor está girando el volante en el mismo sentido que la inclinación de la cabeza, no se
interpretará como somnolencia. En este caso, se supone que cuando un conductor está realizando una
curva acompaña instintivamente la trayectoria del vehículo con un movimiento de la cabeza. Sin embargo,
si el conductor inclina la cabeza lateralmente más de 30º y no está girando el volante se interpreta como
posible síntoma de somnolencia. La condición de “CABEZA INCLINADA” deja de ser cierta cuando se corrija
la posición de la cabeza.
###Distancia de Seguridad: Cada 300 ms el sistema medirá la distancia que le separa del vehículo que le
precede. Si la distancia es menor que la distancia de seguridad recomendada, siendo ésta igual a (Velocidad
/ 10)2
se considera el síntoma de “DISTANCIA INSEGURA”. Si la distancia es menor que la mitad de la
distancia de seguridad recomendada se interpretará que hay “DISTANCIA IMPRUDENTE” por no guardar la
distancia de seguridad. Si la distancia es menor que un tercio de la distancia de seguridad recomendada se
interpretará que hay “PELIGRO COLISION”. El síntoma desaparece cuando deja de cumplirse la situación
descrita.
###Giros de volante: Se leerá la posición del volante cada 350 ms. Si se producen giros bruscos entre dos
lecturas (hay una diferencia de 20º entre dos valores consecutivos) y la velocidad del vehículo es mayor de
40 km/h, se interpreta que el conductor está realizando correcciones cortas y anómalas, por lo que se
considera el síntoma de “VOLANTAZO”.
##VISUALIZACIÓN DE DATOS
El sistema actualizará en el Display la siguiente información una vez por segundo:
###Distancia actual con el vehículo precedente
###Velocidad Actual
###Síntomas detectados en el conductor, según lo especificado en el epígrafe anterior.
No se especifica un formato concreto
##DETECCIÓN DE RIESGOS Y ACTUACIONES
Cada 150 ms. se analizarán los síntomas para detectar posibles riesgos, ante los cuales el sistema tendrá que
reaccionar llevando a cabo algunas actuaciones.
Si se detecta únicamente el síntoma de VOLANTAZO, se considera una distracción leve y se emitirá un pitido
de volumen 1.
Si se da el síntoma de CABEZA INCLINADA el sistema emitirá un pitido de intensidad 2. Si además, la velocidad
del vehículo es mayor de 70 km/h. el pitido será de intensidad 3.
Si se da el síntoma de DISTANCIA INSEGURA se enciende la luz. En caso de DISTANCIA IMPRUDENTE se emite
un pitido de intensidad 4 y se enciende la luz.
En caso de producirse los síntomas de PELIGRO COLISIÓN y CABEZA INCLINADA simultáneamente se emite un
pitido de nivel 5 y se activa el freno del vehículo.
En todos los casos las acciones se mantienen hasta que desaparezca la situación de riesgo correspondiente. 