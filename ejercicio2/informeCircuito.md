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

### Ejercicio 3
Hicimos a mano una tabla de verdad de un sumador de 1 bit, usando karnaugh llegamos al circuito.
Luego unimos 3 restadores de 1 bit para crear el restador de 3 bits.

### Ejercicio 4
Para resolver la funcion aplicamos Karnaugh y de esta forma simplificamos para obtener la menor cantidad de compuertas.

### Ejercicio 6
Es una compuerta XOR de 6 entradas, el resultado da positivo cuando hay un numero impar de entradas(funcionamiento estandar de compuerta XOR)

### Ejercicio 7
Creamos la tabla de verdad de la funcion que se necesitaba en la funcionalidad de analizar circuitos.
Luego Logisim automaticamente creo el circuito necesario.

### Ejercicio 8
Hicimos a mano un restador de 1 bit, usando karnaugh llegamos a las compuertas necesarias.
Unimos 2 veces el circuito del restador de 1 bit, para llegar a un restador de 2 bits.

### Banderas
Las banderas se muestran como luces led al lado del circuito al que pertenece la bandera.

### Salida
Utilizamos un multiplexor con la entrada de cada funcion del circuito que tiene salida.
Para las funciones que tienen salida de 1 bit, este bit se mostrara en el bit mas significativo de la salida(bit de la izquierda).
Para la resta, que tiene resultado de 2 bits, decidimos mostrar los bits del resultado en los bits mas significativos, y el tercer bit muestra si hubo overflow.

