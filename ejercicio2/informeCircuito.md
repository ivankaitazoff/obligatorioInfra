# Obligatorio Infraestructura
## Informe Ejercicio 2

### Ingreso de palabra
Para ingresar los datos a la maquina decidimos separar los datos en 3 grupos, cada grupo de 3 bits, estos se llaman ABC, DEF y GHI.

### Control de la maquina
El control de la maquina es una entrada de 1 bit, para que la maquina actue hay que activarlo y desactivarlo.

### Memoria interna
Decidimos hacer la memoria interna con flip flops tipo D, esta memoria tiene la capacidad de almacenar 8 palablas de 3 bits.
Esta memoria la utilizamos en las opciones 000(guardar), 001(mostrar posicion de memoria), 100(borrar).
Es necesario activar la entrada llamada "procesar" para utilizar las funciones guardar en memoria y borrar la memoria 
Para la opcion 100(borrar) usamos la entrada reset que deja todos los flip plops en 0

### Ejercicio 4
Para resolver la funcion aplicamos Karnaugh y de esta forma simplificamos para obtener la menor cantidad de compuertas.

### Banderas


### Salida
PREGUNTAR SI LA SALIDA DE LA MAQUINA LA TENEMOS QUE UNIR CON LOS EJEJRCICIOS QUE TIENEN 1 O 2 BITS DE SALIDA
PREGUNTAR: HAY QUE DESACTIVAR LOS CIRCUITOS QUE NO ESTEMOS USANDO?
